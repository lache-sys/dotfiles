{ config, pkgs, ... }:

{
  programs = {
    mpv = {
      enable = true;
      bindings = {
      };
      config = {
        "ao" = "avfoundation";
        "audio-stream-silence" = true;
        "audio-wait-open" = 2;
        "border" = false;
        "cache" = true;
        "demuxer-max-bytes" = "512M";
        "demuxer-readahead-secs" = 20;
        "fullscreen" = true;
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
