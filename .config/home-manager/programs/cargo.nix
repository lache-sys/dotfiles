{ config, pkgs, ... }:

{
  programs = {
    cargo = {
      enable = false;
    };
  };
}
