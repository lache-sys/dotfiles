{pkgs, ...}: {
  ids = {
    gids = {
      nixbld = 350;
    };
  };
  nix = {
    enable = false;
    settings = {
      max-jobs = 8;
    };
  };
  security.pam.services.sudo_local = {
    touchIdAuth = true;
    reattach = true;
  };
  system = {
    defaults = {
      dock = {
        autohide = true;
        show-recents = false;
        orientation = "bottom";
      };
      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        FXPreferredViewStyle = "clmv";
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 10;
        KeyRepeat = 1;
        NSAutomaticCapitalizationEnabled = false;
      };
      trackpad = {
        Clicking = true;
      };
    };
    primaryUser = "admin";
    stateVersion = 7;
  };
}
