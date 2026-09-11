{ config, pkgs, ... }:

{
  programs = {
    tmuxinator = {
      enable = true;
      projects = {
        quarter = {
          root = "~/Downloads";
          windows = [
            {
              editor = {
                layout = "tiled";
                panes = [
                  "clear"
                  "clear"
                  "clear"
                  "clear"
                ];
              };
            }
          ];
        };
      };
    };
  };
}
