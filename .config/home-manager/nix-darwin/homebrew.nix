{ config, pkgs, ... }:

{
  homebrew = {
    caskArgs = {
      appdir = "~/Applications";
    };
    enable = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
      extraFlags = [
        "--force-cleanup"
      ];
      upgrade = true;
    };
    taps = [
      {
        name = "lache-sys/tap";
        clone_target = "https://codeberg.org";
      }
    ];
    brews = [
      "clamav"
      "dosbox-x"
      "dvdbackup"
      "felinks"
      "ffmpeg"
      "ffmpeg-full"
      "ffms2"
      "kubernetes-cli"
      "lazymake"
      "llvm"
      "media-info"
      "mpv"
      "nodebrew"
      "openjdk"
      "py3cairo"
      "rom-tools"
      "rvvm"
      "sevenzip"
      "tag"
      "tmuxinator"
      "vcdimager"
      "webp"
    ];
    casks = [
      "lache-sys/tap/8bitdo-firmware-updater"
      "adguard"
      "adobe-acrobat-pro"
      "adobe-creative-cloud"
      "affinity"
      "alfred"
      "lache-sys/tap/authme"
      "bartender"
      "basictex"
      "bettertouchtool"
      "chatgpt"
      "cog-app"
      "crossover"
      "cryptomator"
      "discord"
      "lache-sys/tap/duckstation"
      "fujitsu-scansnap-home"
      "font-aguafina-script"
      "font-alex-brush"
      "font-allura"
      "font-almendra"
      "font-almendra-display"
      "font-almendra-sc"
      "font-amiko"
      "font-arbutus"
      "font-bilbo"
      "font-bilbo-swash-caps"
      "font-cherry-bomb-one"
      "font-chomsky"
      "font-codystar"
      "font-delius"
      "font-delius-swash-caps"
      "font-delius-unicase"
      "font-dotgothic16"
      "font-finlandica"
      "font-fredoka"
      "font-klee-one"
      "font-m+-nerd-font"
      "font-metal"
      "font-metal-mania"
      "font-mochiy-pop-one"
      "font-mochiy-pop-p-one"
      "font-playball"
      "font-poprumcute"
      "font-press-start-2p"
      "font-princess-sofia"
      "font-rampart-one"
      "font-reggae-one"
      "font-rocknroll-one"
      "font-shippori-antique"
      "font-shippori-antique-b1"
      "font-shippori-mincho"
      "font-shippori-mincho-b1"
      "font-skranji"
      "font-stick"
      "font-train-one"
      "font-ysabeau"
      "font-ysabeau-infant"
      "font-ysabeau-office"
      "font-ysabeau-sc"
      "font-yuji-boku"
      "font-yuji-mai"
      "font-yuji-syuku"
      "font-zen-antique"
      "font-zen-antique-soft"
      "font-zen-kaku-gothic-antique"
      "font-zen-kaku-gothic-new"
      "font-zen-kurenaido"
      "font-zen-maru-gothic"
      "font-zen-old-mincho"
      "freefilesync"
      "fuse-t"
      "google-chrome"
      "google-drive"
      "hhkb"
      "lache-sys/tap/kamvas-pro-13-2-5k-driver"
      "keybase"
      "puremac"
      "quicklook-video"
      "retroarch-metal"
      "syntax-highlight"
      "twine-app"
      "veracrypt-fuse-t"
      "zoom"
    ];
    masApps = {
      "Amphetamine" = 937984704;
      "aSPICE" = 1560593107;
      "AutoMute" = 1118136179;
      "Bitwarden" = 1352778147;
      "BrightIntosh" = 6452471855;
      "Clamshell" = 6477896729;
      "DaisyDisk" = 411643860;
      "Duplicate File Finder Pro" = 962263890;
      "EdgeView" = 1580323719;
      "GrandPerspective" = 1111570163;
      "Hide My Screen" = 6476070422;
      "Iris" = 6761598836;
      "Jump Desktop" = 524141863;
      "LINE" = 539883307;
      "Mp3tag" = 1532597159;
      "Name Mangler 3" = 603637384;
      "Pure Paste" = 1611378436;
      "Spark" = 1176895641;
      "TinyHost" = 6757653859;
      "V1MML" = 971745309;
      "Yoink" = 457622435;
    };
  };
} 
