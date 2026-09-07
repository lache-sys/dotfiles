{ config, pkgs, ... }:

{
  programs = {
    texlive = {
      enable = true;
      extraPackages = tpkgs: {
        inherit (tpkgs)
          scheme-medium
          collection-langjapanese
          collection-latexextra
          collection-luatex;
      };
    };
  };
}
