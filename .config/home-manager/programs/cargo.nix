{ config, pkgs, ... }:

{
  programs = {
    cargo = {
      enable = true;
    };
  };
}
