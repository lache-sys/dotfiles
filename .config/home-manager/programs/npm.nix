{
  config,
  pkgs,
  ...
}:

{
  programs = {
    npm = {
      enable = true;
      package = pkgs.nodejs_26;
      settings = {
        color = true;
        init-license = "MIT";
      };
    };
  };
}
