{ config, pkgs, ... }:

{
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      initContent = ''
        if [[ "$(uname)" == "Darwin" ]]; then
          SSH_AUTH_SOCK = "${config.home.homeDirectory}/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock";
        fi
      '';
    };
  };
}
