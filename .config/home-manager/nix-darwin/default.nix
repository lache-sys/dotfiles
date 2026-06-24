{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      gnupg
      keybase
    ];
  };
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
        ImageCapture = {
          disableHotPlug = true;
        };
        inputmethod = {
          Kotoeri = {
            JIMPrefFullWidthNumeralCharactersKey = 0;
          };
        };
        keyboard = {
          fnState = true;
        };
        menuextra = {
          battery = {
            ShowPercent = "YES";
          };
          clock = {
            DateFormat = "EEE d MMM HH:mm";
          };
        };
        NSGlobalDomain = {
          WebKitDeveloperExtras = true;
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
#         NewWindowTargetPath = file://;
        ShowPathbar = true;
        ShowStatusBar = true;
      };
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 10;
        KeyRepeat = 1;
        NSAutomaticCapitalizationEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        NSDocumentSaveNewDocumentsToCloud = true;
      };
      trackpad = {
        Clicking = true;
      };
      screencapture = {
        location = "~/Downloads";
      };
    };
    primaryUser = "lache-sys";
    stateVersion = 7;
  };
  users = {
    users = {
      admin = {
        name = "admin";
        home = /Users/admin;
      };
    };
  };
}
