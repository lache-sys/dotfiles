{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{
  home = {
    packages = [
      pkgs.clamav
    ];
  };
}
