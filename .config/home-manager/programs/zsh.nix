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
        function clamdf_main () {
          _pwd=''${PWD}
          cd "$(dirname "''${1}")"
          clamdscan -i -m --remove -f "''${1}"
          cd ''${_pwd}
          return 0
        }
        function cut4dl_main () {
          _i=0
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
        function lsg_main () {
          _pwd="''${PWD}"
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
          sudo nix run nix-darwin -- switch --flake .#lache-sys-darwin
          return 0
        }
        function rpds_main () {
          dd if=/dev/random of=${config.home.homeDirectory}/Downloads/tmp.img bs=1073741824 count="''${1}"
          return 0
        }
        compdef clamdf_main _clamdf_main
        compdef cut4dl_main _cut4dl_main
        compdef lsg_main _lsg_main
        eval $(/opt/homebrew/bin/brew shellenv)
        export GPG_TTY=$(tty)
        if [[ "$(uname)" == "Darwin" ]]; then
          export SSH_AUTH_SOCK="${config.home.homeDirectory}/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock"
        fi
        if [[ "$(uname)" == "Darwin" && -x /Applications/BrightIntosh.app ]]; then
          alias brightintosh='open -a BrightIntosh && /Applications/BrightIntosh.app/Contents/Resources/cli.sh'
        fi
        if [[ $SHLVL = 1 ]]; then
          tmuxinator start quarter
        fi
        source ~/.venv/bin/activate
      '';
      shellAliases = {
        cat = "bat --paging=never";
        clamddl = "clamdscan ~/Downloads -i -m --remove";
        clamdf = "clamdf_main";
        cut4dl = "cut4dl_main";
        d2u = "dos2unix";
        gaa = "git add -A";
        ls = "eza --icons --group-directories-first";
        lsg = "lsg_main";
        nixall = "nixall_main";
        rpds = "rpds_main";
        smart = "smartctl -a";
        sza = "7zz a -mmt=on -mx=9 -sdel";
        vvim = "vim -u NONE -N";
      };
      syntaxHighlighting = {
        enable = true;
      };
    };
  };
}
