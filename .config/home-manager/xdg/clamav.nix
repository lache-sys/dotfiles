{ config, pkgs, ... }:

{
  xdg = {
    configFile = {
      "clamav/clamd.conf" = {
        text = ''
          DatabaseDirectory ${config.home.homeDirectory}/.config/clamav/db
          LogFile ${config.home.homeDirectory}/.config/clamav/clamd.log
          LogTime yes
          LogClean yes
          LocalSocket ${config.home.homeDirectory}/.config/clamav/clamd.ctl
          FixStaleSocket yes
        '';
      };
      "clamav/freshclam.conf" = {
        text = ''
          DatabaseDirectory ${config.home.homeDirectory}/.config/clamav/db
          UpdateLogFile ${config.home.homeDirectory}/.config/clamav/freshclam.log
          LogTime yes
          DatabaseOwner ${config.home.username}
          DatabaseMirror database.clamav.net
        '';
      };
    };
  };
}
