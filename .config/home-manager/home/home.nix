{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

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
      SSH_AUTH_SOCK = "${config.home.homeDirectory}/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock";
    });
    activation = {
      createClamAVDirs = ''
        mkdir -p "${config.home.homeDirectory}/.config/clamav/db"
      '';
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
        source = ../config/mpv/fonts/Material-Design-Iconic-Font.ttf;
      };
    };
  };
}
