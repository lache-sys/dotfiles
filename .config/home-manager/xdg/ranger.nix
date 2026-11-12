{
  config,
  pkgs,
  ...
}:

{
  xdg = {
    configFile = {
      "ranger/scope.sh" = {
        executable = true;
        text = ''
        '';
      };
    };
  };
}
