{ config, pkgs, ... }:

{
  xdg = {
    configFile = {
      "bettercmdtab/config.json" = {
        text = ''
          {
            "layoutMode": "list",
            "panelScalePercent": 100,
            "showWindowTitleLabel": false,
            "sortOrder": "alphabetical"
          }
        '';
      };
    };
  };
}
