{ config, pkgs, ... }:

{
  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      pinentry = {
      } // (if pkgs.stdenv.hostPlatform.isLinux then {
        package = pkgs.pinentry-all;
      } else {
      });
    };
  };
}
