{ config, pkgs, ... }:

{
  programs = {
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      includes = [
        "${config.home.homeDirectory}/.ssh/config.local"
      ];
      settings = {
        Proxmox = {
          AddKeysToAgent = "ask";
          KbdInteractiveAuthentication = false;
          PasswordAuthentication = false;
          Port = 22;
          PreferredAuthentications = "publickey";
          PubkeyAuthentication = true;
          RemoteCommand = "none";
        };
      };
    };
  };
}
