{ config, pkgs, ... }:

{
  programs = {
    ranger = {
      enable = true;
      aliases = {
        e = "edit";
        setl = "setlocal";
        q = "quit";
      };
      extraConfig = ''
      '';
      extraPackages = [
        pkgs.ffmpegthumbnailer
        pkgs.poppler
        pkgs.ueberzugpp
      ];
      mappings = {
      };
      rifle = [
      ];
      settings = {
        column_ratios = "1,3,4";
        confirm_on_delete = "always";
        preview_images = true;
        preview_images_method = "ueberzug";
        show_hidden = true;
      };
    };
  };
}
