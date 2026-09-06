{ config, pkgs, ... }:

{
  programs = {
    texlive = {
      enable = true;
      extraPackages = {
        langjapanese = pkgs.texlivePackages.collection-langjapanese;
        latexextra = pkgs.texlivePackages.collection-latexextra;
        luatex = pkgs.texlivePackages.collection-luatex;
      };
      packageSet = pkgs.texliveFull;
    };
  };
}
