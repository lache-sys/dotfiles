{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

let
  authme = pkgs.callPackage ./mkderivation/authme/default.nix { };
  aozora-mincho = pkgs.callPackage ./mkderivation/aozora-mincho.nix { };
  corporate-logo-rounded = pkgs.callPackage ./mkderivation/corporate-logo-rounded.nix { };
  gputeks = pkgs.callPackage ./mkderivation/gputeks.nix { };
  kh-dot = pkgs.callPackage ./mkderivation/kh-dot.nix { };
  mgenplus = pkgs.callPackage ./mkderivation/mgenplus.nix { };
  np2kai = pkgs.callPackage ./mkderivation/np2kai.nix { };
  ntsc-rs = pkgs.callPackage ./mkderivation/ntsc-rs.nix { };
  rounded-l-mgenplus = pkgs.callPackage ./mkderivation/rounded-l-mgenplus.nix { };
  rounded-mgenplus = pkgs.callPackage ./mkderivation/rounded-mgenplus.nix { };
  rounded-x-mgenplus = pkgs.callPackage ./mkderivation/rounded-x-mgenplus.nix { };
  rusty-backup = pkgs.callPackage ./mkderivation/rusty-backup.nix { };
  tag = pkgs.callPackage ./mkderivation/tag.nix { };
  tiny5 = pkgs.callPackage ./mkderivation/tiny5.nix { };
  ume = pkgs.callPackage ./mkderivation/ume.nix { };
  x5y8pxnegaclip = pkgs.callPackage ./mkderivation/x5y8pxnegaclip.nix { };
  x5y8pxnegatape = pkgs.callPackage ./mkderivation/x5y8pxnegatape.nix { };
  x8y12pxdenkichip = pkgs.callPackage ./mkderivation/x8y12pxdenkichip.nix { };
  ymfm = pkgs.callPackage ./mkderivation/ymfm.nix { };
in
{
  home = {
    username = "lache-sys";
    homeDirectory = if pkgs.stdenv.hostPlatform.isDarwin then "/Users/lache-sys" else "/home/lache-sys";
    stateVersion = "26.05";
# Please read the comment before changing.
    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
      "/opt/X11/bin"
    ];
    sessionVariables = {
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
      LD_LIBRARY_PATH = lib.concatStringsSep ":" [
        (lib.makeLibraryPath [
          pkgs.libglvnd
          pkgs.mesa
        ])
        "$LD_LIBRARY_PATH"
      ];
      SSH_AUTH_SOCK = "${config.home.homeDirectory}/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock";
    });
    packages = [
      aozora-mincho
      corporate-logo-rounded
      gputeks
      kh-dot
      mgenplus
      np2kai
      ntsc-rs
      pkgs._7zz
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
      pkgs.dexed
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
      pkgs.fzf
      pkgs.gcc
      pkgs.gcc-arm-embedded
      pkgs.geist-font
      pkgs.gettext
      pkgs.gh
      pkgs.gnumake
      pkgs.gpac
      pkgs.grandorgue
      pkgs.hackgen-nf-font
      pkgs.ia-writer-duospace
      pkgs.ia-writer-mono
      pkgs.ia-writer-quattro
      pkgs.imagemagickBig
      pkgs.img2pdf
      pkgs.ipafont
      pkgs.ipaexfont
      pkgs.ipatool
      pkgs.jack2
      pkgs.jhead
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
      pkgs.mtools
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
      pkgs.premake
      pkgs.pv
      pkgs.pvetui
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
      pkgs.uutils-coreutils
      pkgs.uv
      pkgs.vcpkg
      pkgs.vgmstream
      pkgs.vimv
      pkgs.wakeonlan
      pkgs.wget
      pkgs.xauth
      pkgs.xdpyinfo
      pkgs.xhost
      pkgs.yt-dlp
      pkgs.zoxide
      pkgs.zilla-slab
      rounded-l-mgenplus
      rounded-mgenplus
      rounded-x-mgenplus
      rusty-backup
      tiny5
      x5y8pxnegaclip
      x5y8pxnegatape
      x8y12pxdenkichip
      ymfm
    ] ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin [
      authme
      pkgs.apple-sdk
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
      pkgs.brewCasks.tactile
      pkgs.brewCasks.twine-app
      pkgs.brewCasks.whatcable
      pkgs.brewCasks.zoom
      pkgs.darwin.libiconv
      pkgs.darwin.trash
      pkgs.duti
      pkgs.mas
      pkgs.pam-reattach
      pkgs.pinentry_mac
      pkgs.vlc-bin
      pkgs.xquartz
      tag
      ume
    ] ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [
      pkgs.a2jmidid
      pkgs.caffeine-ng
      pkgs.carla
      pkgs.cryptomator
      pkgs.freefilesync
      pkgs.libglvnd
      pkgs.mesa
      pkgs.niri
      pkgs.nirius
      pkgs.pinentry-all
      pkgs.yabridge
    ];
    activation = {
      createClamAVDirs = ''
        mkdir -p "${config.home.homeDirectory}/.config/clamav/db"
      '';
    };
    file = {
    };
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
      "mpv/fonts/Material-Design-Iconic-Font.ttf" = {
        source = ./config/mpv/fonts/Material-Design-Iconic-Font.ttf;
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
    };
  };
}
