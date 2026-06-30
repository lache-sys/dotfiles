{ config, pkgs, ... }:

{
  programs = {
    zsh = {
      completionInit = "autoload -U compinit && compinit";
      enable = true;
      enableCompletion = true;
      initContent = ''
        function _clamdf_main () {
          _files -W ./
        }
        function _cut4dl_main () {
          _files -W ./
        }
        function _lsg_main () {
          _files -W ./
        }
        function _openurls_main () {
          _files -W ./
        }
        function clamdf_main () {
          local _pwd=''${PWD}
          cd "$(dirname "''${1}")"
          clamdscan -i -m --remove -f "''${1}"
          cd ''${_pwd}
          return 0
        }
        function cut4dl_main () {
          local _i=0
          cd ~/Downloads
          cut -d ',' -f 2 "''${1}" | sed -e '1,2d' > req.txt
          while read LINE; do
            _origname=$(basename ''${LINE})
            _ext=''${_origname##*.}
            _i=$((_i+1))
            _i4=$(printf "%04d" "''${_i}")
            wget -O ''${_i4}.''${_ext} ''${LINE}
          done < req.txt
          rm -f req.txt
          return 0
        }
        function emg_main () {
          local _ssddir=$(ssddir_main)
          python3 ''${_ssddir}/git/emg/bin/emg.py -i ''${_ssddir}/git/emg/bin/lnk.toml
          return 0
        }
        function emgc_main () {
          local _ssddir=$(ssddir_main)
          python3 ''${_ssddir}/git/emg/bin/emg.py -c -i ''${_ssddir}/git/emg/bin/lnk.toml
          return 0
        }
        function emgl_main () {
          local _ssddir=$(ssddir_main)
          python3 ''${_ssddir}/git/emg/bin/lnk.py -i ''${_ssddir}/git/emg/bin/lnk.toml
          return 0
        }
        function iclean_main () {
          local _pwd=''${PWD}
          if [[ "$(uname)" == "Darwin" ]]; then
            cd "''${HOME}/Library/Mobile Documents"
            find . -type f -exec brctl evict {} \;
            cd ''${_pwd}
          else
            echo "Sorry, this function is for macOS Only."
            return 1
          fi
          return 0
        }
        function img2webp_main () {
          _pwd=''${PWD}
          export CPPFLAGS="-I/opt/homebrew/opt/ffmpeg-full/include"
          export LDFLAGS="-L/opt/homebrew/opt/ffmpeg-full/lib"
          export PATH="/opt/homebrew/opt/ffmpeg-full/bin:$PATH"
          export PKG_CONFIG_PATH="/opt/homebrew/opt/ffmpeg-full/lib/pkgconfig"
          cd "''${_pwd}"
          for i in *''${1}; do
            ffmpeg -i ''${i} -c:v libwebp -lossless 1 $(basename ''${i} ''${1}).webp
          done
          return 0
        }
        function lsg_main () {
          local _pwd="''${PWD}"
          cd "''${1}"
          for i in */; do
            cd "''${i}"
            _gss=$(git status -s)
            if [[ ''${_gss} ]]; then
              echo "''${i}"
              git status -s
            fi
            cd ..
          done
          cd "''${_pwd}"
          return 0
        }
        function nixall_main () {
          cd ${config.home.homeDirectory}/.config/home-manager
          nix flake update
          home-manager switch --flake .
          if [[ "$(uname)" == "Darwin" ]]; then
            sudo nix run nix-darwin -- switch --flake .#lache-sys-darwin
          fi
          return 0
        }
        function openurls_main () {
          while IFS= read -r url; do
            if [[ "$(uname)" == "Darwin" ]]; then
              open -a "Safari" ''${url}
            fi
            sleep 1
          done < ''${1}
          return 0
        }
        function png2webp_main () {
          local _pwd=''${PWD}
          cd "''${_pwd}"
          for i in *.png; do
            ffmpeg -i "''${i}" -lossless 1 $(basename "''${i}" ''${i}).webp
          done
          return 0
        }
        function ssddir_main () {
          if [[ "$(uname)" == "Darwin" ]]; then
            local _ssddir=$(sops -d --extract '["mac_ssd_dir"]' ~/.env)
          elif [[ "$(uname)" == "Linux" ]]; then
            local _ssddir=$(sops -d --extract '["lnx_ssd_dir"]' ~/.env)
          fi
          if [[ ! -d ''${_ssddir} ]]; then
            echo "Please connect the SSD."
            return 1
          fi
          echo ''${_ssddir}
          return 0
        }
        function roscheck_main () {
          pgrep -q oahd && echo "Rosetta 2 is installed" || echo "Rosetta 2 is NOT installed"
          return 0
        }
        function rpds_main () {
          dd if=/dev/random of=${config.home.homeDirectory}/Downloads/tmp.img bs=1073741824 count="''${1}"
          return 0
        }
        compdef clamdf_main _clamdf_main
        compdef cut4dl_main _cut4dl_main
        compdef lsg_main _lsg_main
        compdef openurls_main _openurls_main
        export GPG_TTY=$(tty)
        if [[ "$(uname)" == "Darwin" ]]; then
          export SSH_AUTH_SOCK="${config.home.homeDirectory}/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock"
        fi
        if [[ "$(uname)" == "Darwin" && -x /Applications/BrightIntosh.app ]]; then
          alias brightintosh='open -a BrightIntosh && /Applications/BrightIntosh.app/Contents/Resources/cli.sh'
        fi
        source ~/.venv/bin/activate
      '';
      profileExtra = ''
        if [[ $(uname -m) == "arm64" || $(uname -m) == "aarch64" ]]; then
          eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [[ $(uname -m) == "x86_64" ]]; then
          eval "$(/usr/local/bin/brew shellenv)"
        fi
        if [[ $SHLVL = 1 ]]; then
          tmux
        fi
      '';
      shellAliases = {
        cat = "bat --paging=never";
        clamddl = "clamdscan ~/Downloads -i -m --remove";
        clamdf = "clamdf_main";
        cut4dl = "cut4dl_main";
        d2u = "dos2unix";
        emg = "emg_main";
        emgc = "emgc_main";
        emgl = "emgl_main";
        gaa = "git add -A";
        img2webp = "img2webp_main";
        less = "bat";
        ls = "eza --icons --group-directories-first";
        lsg = "lsg_main";
        nixall = "nixall_main";
        openurls = "openurls_main";
        png2webp = "img2webp_main .png";
        roscheck = "roscheck_main";
        rpds = "rpds_main";
        smart = "smartctl -a";
        ssddir = "ssddir_main";
        sza = "7zz a -mmt=on -mx=9 -sdel";
        vvim = "vim -u NONE -N";
      };
      syntaxHighlighting = {
        enable = true;
      };
    };
  };
}
