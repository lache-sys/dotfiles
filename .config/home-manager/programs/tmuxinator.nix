{ config, pkgs, ... }:

{
  programs = {
    tmux = {
      tmuxinator = {
        enable = true;
        projects = {
          quarter = {
            name = "quarter";
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
  };
}
