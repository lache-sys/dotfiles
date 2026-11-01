{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lache-sys";
  home.homeDirectory = if pkgs.stdenv.hostPlatform.isDarwin then "/Users/lache-sys" else "/home/lache-sys";
  home.sessionPath = [
    "${config.home.homeDirectory}/.local/bin"
  ];
  home.sessionVariables = {
    CMAKE_MAKE_PROGRAM = "${pkgs.ninja}/bin/ninja";
    CMAKE_PREFIX_PATH = "${config.home.profileDirectory}";
    CPATH = "${config.home.profileDirectory}/include";
    CPLUS_INCLUDE_PATH = "${config.home.profileDirectory}/include";
    HOMEBREW_NO_ANALYTICS = true;
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LIBRARY_PATH = "${config.home.profileDirectory}/lib";
    PKG_CONFIG_PATH = "${config.home.profileDirectory}/lib/pkgconfig";
# 9B36E0149A4EAB28E032F2D382BD733A21368364: Expires in 2027-06-04!
    SOPS_PGP_FP = "9B36E0149A4EAB28E032F2D382BD733A21368364";
    TERM = "tmux-256color";
    TOMBI_OFFLINE = true;
    TOMBI_NO_CACHE = true;
    VCPKG_ROOT = "${pkgs.vcpkg}/share/vcpkg";
    XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
  } // (if pkgs.stdenv.hostPlatform.isDarwin then {
    NIX_SSL_CERT_FILE = "/etc/ssl/cert.pem";
    SSH_AUTH_SOCK = "${config.home.homeDirectory}/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock";
  } else {
    SSH_AUTH_SOCK = "${config.home.homeDirectory}/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock";
  });
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  home.activation = {
    createClamAVDirs = ''
      mkdir -p "${config.home.homeDirectory}/.config/clamav/db"
    '';
  };
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.alegreya
    pkgs.alegreya-sans
    pkgs.atool
    pkgs.bat
    pkgs.bchunk
    pkgs.bison
    pkgs.blackout
    pkgs.boost
    pkgs.btop
    pkgs.bzip2
    pkgs.cdrdao
    pkgs.cdrtools
    pkgs.chafa
    pkgs.clamav
    pkgs.colima
    pkgs.cmake
    pkgs.colima
    pkgs.coreutils
    pkgs.cuetools
    pkgs.deno
    pkgs.dmtx-utils
    pkgs.docker
    pkgs.docker-compose
    pkgs.docutils
    pkgs.dolphin-emu
    pkgs.dos2unix
    pkgs.dosbox-x
    pkgs.dvdauthor
    pkgs.exiftool
    pkgs.eza
    pkgs.f3
    pkgs.fastfetch
    pkgs.fclones
    pkgs.fdupes
    pkgs.ffmpeg-full
    pkgs.ffms
    pkgs.flac
    pkgs.flex
    pkgs.fluidsynth
    pkgs.fontconfig
    pkgs.freepats
    pkgs.furnace
    pkgs.fzf
    pkgs.gcc
    pkgs.gcc-arm-embedded
    pkgs.geist-font
    pkgs.gettext
    pkgs.gh
    pkgs.gnumake
    pkgs.gpac
    pkgs.hackgen-nf-font
    pkgs.jack2
    pkgs.jhead
    pkgs.ia-writer-duospace
    pkgs.ia-writer-mono
    pkgs.ia-writer-quattro
    pkgs.imagemagickBig
    pkgs.img2pdf
    pkgs.ipafont
    pkgs.ipaexfont
    pkgs.ipatool
    pkgs.keybase
    pkgs.lazyssh
    pkgs.less
    pkgs.libaacs
    pkgs.libao
    pkgs.libcaca
    pkgs.libisoburn
    pkgs.libogg
    pkgs.libvorbis
    pkgs.libplacebo
    pkgs.libwebp
    pkgs.llvm
    pkgs.mame
    pkgs.markdown-toc
    pkgs.mcomix
    pkgs.mediainfo
    pkgs.melonds
    pkgs.meson
    pkgs.midicsv
    pkgs.ncurses
    pkgs.nerd-fonts."m+"
    pkgs.nerd-fonts.bigblue-terminal
    pkgs.ninja
    pkgs.nix-zsh-completions
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts-cjk-serif
    pkgs.openjdk
    pkgs.openssl
    pkgs.OVMFFull
    pkgs.pandoc
    pkgs.paperkey
    pkgs.parallel
    pkgs.pcre2
    pkgs.pigz
    pkgs.pkgconf
    pkgs.poppler-utils
    pkgs.pv
    pkgs.qemu
    pkgs.rsync
    pkgs.rtmidi
    pkgs.rubik
    pkgs.SDL2
    pkgs.SDL2_sound
    pkgs.sdl3
    pkgs.shntool
    pkgs.smartmontools
    pkgs.sniglet
    pkgs.sops
    pkgs.timidity
    pkgs.tombi
    pkgs.unzrip
    pkgs.uv
    pkgs.vcpkg
    pkgs.vgmstream
    pkgs.vimv
    pkgs.wakeonlan
    pkgs.wget
    pkgs.yt-dlp
    pkgs.zoxide
    pkgs.zilla-slab
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ] ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin [
    pkgs.brewCasks.affinity
    pkgs.brewCasks.alfred
    pkgs.brewCasks.bartender
    pkgs.brewCasks.bettercmdtab
    pkgs.brewCasks.bettertouchtool
    pkgs.brewCasks.cog-app
    pkgs.brewCasks.cryptomator
    pkgs.brewCasks.discord
    pkgs.brewCasks.handbrake-app
    pkgs.brewCasks.hotkeyclash
    pkgs.brewCasks.mactoy
    pkgs.brewCasks.opendisplay
    pkgs.brewCasks.puremac
    pkgs.brewCasks.quicklook-video
    pkgs.brewCasks.syntax-highlight
    pkgs.brewCasks.twine-app
    pkgs.brewCasks.xquartz
    pkgs.brewCasks.zoom
    pkgs.darwin.libiconv
    pkgs.darwin.trash
    pkgs.duti
    pkgs.mas
    pkgs.pam-reattach
    pkgs.pinentry_mac
    pkgs.vlc-bin
#     pkgs.xquartz
  ] ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [
    pkgs.a2jmidid
    pkgs.carla
    pkgs.cryptomator
    pkgs.freefilesync
    pkgs.niri
    pkgs.nirius
    pkgs.pinentry-all
    pkgs.yabridge
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  fonts = {
    fontconfig = {
      enable = true;
    };
  };
  manual = {
    manpages = {
      enable = false;
    };
  };
  nixpkgs = {
    overlays = [
      inputs.brew-nix.overlays.default
    ];
  };
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/admin/etc/profile.d/hm-session-vars.sh
  #

  # Let Home Manager install and manage itself.
  programs = {
    home-manager = {
      enable = true;
    };
    gpg = {
      enable = true;
    };
  };
  xdg = {
    configFile = {
      "btop/themes" = {
        recursive = true;
        source = ./config/btop/themes;
      };
      "homebrew/trust.json" = {
        text = ''
          {
            "trustedtaps": [
              "https://codeberg.org/lache-sys/homebrew-tap"
            ]
          }
        '';
      };
      "mpv/fonts/Material-Design-Iconic-Font.ttf" = {
        source = ./config/mpv/fonts/Material-Design-Iconic-Font.ttf;
      };
    };
  };
}
