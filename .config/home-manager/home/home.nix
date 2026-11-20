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
# Please read the comment before changing.
    stateVersion = "26.05";
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
}
