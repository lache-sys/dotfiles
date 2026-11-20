{
  config,
  pkgs,
  ...
}:

{
  homebrew = {
    caskArgs = {
      appdir = "~/Applications";
    };
    enable = true;
    user = "lache-sys";
    onActivation = {
      autoUpdate = false;
      extraFlags = [
        "--force-cleanup"
      ];
      upgrade = true;
    };
  };
} 
