{ config, pkgs, ... }:

{
  services = {
    gpg-agent = {
      enable = true;
      enableBashIntegration = true;
      enableSshSupport = true;
      enableZshIntegration = true;
      pinentry = {
      } // (if pkgs.stdenv.hostPlatform.isLinux then {
        package = pkgs.pinentry-all;
      } else {
        package = pkgs.pinentry_mac;
      });
    };
  };
}
