{ config, pkgs, ... }:

{
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      initExtra = ''
        source ~/.config/myrc/myprofile
        source ~/.config/myrc/myrc
      '';
    };
  };
}
