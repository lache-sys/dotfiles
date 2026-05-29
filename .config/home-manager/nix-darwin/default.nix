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
      CustomUserPreferences = {
        AppleMultitouchTrackpad = {
          FirstClickThreshold = 0;
        };
        desktopservices = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        finder = {
          DisableAllAnimations = false;
          NewWindowTarget = "PfLo";
        };
        inputmethod = {
          Kotoeri = {
            JIMPrefFullWidthNumeralCharactersKey = 0;
          };
        };
        menuextra = {
          battery = {
            ShowPercent = "YES";
          };
          clock = {
            DateFormat = "EEE d MMM HH:mm";
          };
        };
        TimeMachine = {
          DoNotOfferNewDisksForBackup = true;
        };
      };
      dock = {
        autohide = true;
        show-recents = false;
        launchanim = true;
        orientation = "bottom";
      };
      finder = {
        _FXSortFoldersFirst = true;
        _FXSortFoldersFirstOnDesktop = true;
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
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
      screencapture = {
        location = "~/Downlads";
      };
    };
    primaryUser = "admin";
    stateVersion = 7;
  };
}
