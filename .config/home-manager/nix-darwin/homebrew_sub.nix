{
  config,
  pkgs,
  ...
}:

{
  homebrew = {
    casks = [
      "freefilesync"
    ];
    masApps = {
      "Amphetamine" = 937984704;
      "Bitwarden" = 1352778147;
      "Xcode" = 497799835;
    };
  };
}
