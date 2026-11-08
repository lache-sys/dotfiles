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
        "*" = {
          ForwardX11 = true;
          XAuthLocation = "${pkgs.xauth}";
        };
        PBS = {
          AddKeysToAgent = "ask";
          KbdInteractiveAuthentication = false;
          PasswordAuthentication = false;
          Port = 22;
          PreferredAuthentications = "publickey";
          PubkeyAuthentication = true;
          RemoteCommand = "none";
        };
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
