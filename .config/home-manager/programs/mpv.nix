{
  config,
  inputs,
  pkgs,
  ...
}:

{
  programs = {
    mpv = {
      enable = true;
      bindings = {
      };
      config = {
        "audio-stream-silence" = false;
        "audio-wait-open" = 0;
        "border" = false;
        "cache" = true;
        "demuxer-max-bytes" = "512M";
        "demuxer-readahead-secs" = 20;
        "fullscreen" = true;
        "gapless-audio" = true;
        "hwdec" = "auto-safe";
        "loop-playlist" = "inf";
        "osc" = false;
        "osd-bar" = false;
        "osd-font" = "M+1 Nerd Font";
        "profile" = "fast";
        "prefetch-playlist" = true;
        "screenshot-dir" = "${config.home.homeDirectory}/Downloads";
        "screenshot-format" = "png";
        "screenshot-png-compression" = 0;
      } // (if pkgs.stdenv.hostPlatform.isDarwin then {
        "ao" = "avfoundation";
      } else {
        "ao" = "pipewire";
      });
      profiles = {
        airpods = {
          "profile-desc" = "AirPods";
          "profile-restore" = "copy";
        };
        generic = {
          "profile-desc" = "Generic headphones/speakers";
          "profile-restore" = "copy";
        } // (if pkgs.stdenv.hostPlatform.isDarwin then {
          "ao" = "coreaudio";
        } else {
          "ao" = "pipewire";
        });
      };
      scripts = [
        pkgs.mpvScripts.modernx
        pkgs.mpvScripts.thumbfast
      ];
      scriptOpts = {
        modernx = {
        };
      };
    };
  };
}
