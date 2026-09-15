{ config, pkgs, ... }:

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
    taps = [
      {
        name = "lache-sys/tap";
        clone_target = "https://codeberg.org/lache-sys/homebrew-tap";
      }
    ];
    brews = [
      "dosbox-x"
      "dvdbackup"
      "felinks"
      "ffms2"
      "kubernetes-cli"
      "lazymake"
      "llvm"
      "media-info"
      "nodebrew"
      "openjdk"
      "py3cairo"
      "sevenzip"
      "tag"
    ];
    casks = [
      "lache-sys/tap/8bitdo-firmware-updater"
      "adguard"
      "adobe-acrobat-pro"
      "adobe-creative-cloud"
      "lache-sys/tap/authme"
      "lache-sys/tap/duckstation"
      "fujitsu-scansnap-home"
      "lache-sys/tap/font-4x4kana"
      "font-aguafina-script"
      "font-alex-brush"
      "font-allura"
      "font-almendra"
      "font-almendra-display"
      "font-almendra-sc"
      "font-amiko"
      "lache-sys/tap/font-aozora-mincho"
      "font-arbutus"
      "font-bilbo"
      "font-bilbo-swash-caps"
      "lache-sys/tap/font-cinecaption"
      "font-cherry-bomb-one"
      "font-chomsky"
      "font-codystar"
      "font-delius"
      "font-delius-swash-caps"
      "font-delius-unicase"
      "font-dotgothic16"
      "font-finlandica"
      "font-fredoka"
      "lache-sys/tap/font-jf-dot"
      "lache-sys/tap/font-k6x8"
      "lache-sys/tap/font-k8x12"
      "lache-sys/tap/font-kaeru-kaeru"
      "lache-sys/tap/font-kh-dot"
      "lache-sys/tap/font-gputeks"
      "lache-sys/tap/font-hyper-scrypt"
      "font-klee-one"
      "font-metal"
      "font-metal-mania"
      "lache-sys/tap/font-mgenplus"
      "lache-sys/tap/font-misaki"
      "font-mochiy-pop-one"
      "font-mochiy-pop-p-one"
      "lache-sys/tap/font-ms-gothic"
      "lache-sys/tap/font-ms-mincho"
      "lache-sys/tap/font-oradano-mincho"
      "font-playball"
      "font-poprumcute"
      "font-press-start-2p"
      "font-princess-sofia"
      "font-rampart-one"
      "font-reggae-one"
      "font-rocknroll-one"
      "lache-sys/tap/font-rounded-l-mgenplus"
      "lache-sys/tap/font-rounded-mgenplus"
      "lache-sys/tap/font-rounded-x-mgenplus"
      "font-shippori-antique"
      "font-shippori-antique-b1"
      "font-shippori-mincho"
      "font-shippori-mincho-b1"
      "font-skranji"
      "font-stick"
      "font-tiny5"
      "font-tiny5-duo"
      "font-train-one"
      "lache-sys/tap/font-ume"
      "lache-sys/tap/font-x5y8pxnegaclip"
      "lache-sys/tap/font-x5y8pxnegatape"
      "lache-sys/tap/font-x8y12pxdenkichip"
      "lache-sys/tap/font-yozakura"
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
      "lache-sys/tap/magical-8bit-plug"
      "lache-sys/tap/magical-fds-plug"
      "lache-sys/tap/ntsc-rs"
      "lache-sys/tap/prospect"
      "retroarch-metal"
      "veracrypt-fuse-t"
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
      "GarageBand" = 682658836;
      "GrandPerspective" = 1111570163;
      "Hide My Screen" = 6476070422;
      "Jump Desktop" = 524141863;
      "LINE" = 539883307;
      "MIDI Tape Recorder" = 1598618004;
      "Mp3tag" = 1532597159;
      "Name Mangler 3" = 603637384;
      "Photo Naminator" = 1598189356;
      "Pure Paste" = 1611378436;
      "RosettaCheck" = 6759349750;
      "Spark" = 1176895641;
      "TinyHost" = 6757653859;
      "V1MML" = 971745309;
      "Xcode" = 497799835;
      "Yoink" = 457622435;
    };
  };
} 
