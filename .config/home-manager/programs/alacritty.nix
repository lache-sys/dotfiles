{ config, pkgs, ... }:

{
  programs = {
    alacritty = {
      enable = true;
      settings = {
        colors = {
          primary = {
            background = "#191919";
            foreground = "#F9F7EF";
          };
          normal = {
            black = "#444844";
            red = "#D95673";
            green = "#8CC06D";
            yellow = "#EEBE36";
            blue = "#5CAADB";
            magenta = "#B594CB";
            cyan = "#44A9BA";
            white = "#FBFAF7";
          };
          bright = {
            black = "#6C6D6B";
            red = "#DBA1B4";
            green = "#898E38";
            yellow = "#8A6B3C";
            blue = "#126B8B";
            magenta = "#7457A1";
            cyan = "#87C6D3";
            white = "#BFC1BB";
          };
        };
        env = {
          term = "xterm-256color";
        };
        font = {
          normal = {
            family = "M+1Code Nerd Font";
            style = "Regular";
          };
          bold = {
            style = "Bold";
          };
          size = 12;
        };
        window = {
          dimensions = {
            columns = 80;
            lines = 25;
          };
          opacity = 0.95;
          startup_mode = "Fullscreen";
          title = "Alacritty";
        };
      };
    };
  };
}
