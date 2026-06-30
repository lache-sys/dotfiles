{ config, pkgs, inputs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lache-sys";
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/lache-sys" else "/home/lache-sys";
  home.sessionPath = [
    "/opt/homebrew/opt/ffmpeg-full/bin:$PATH"
  ];
  home.sessionVariables = {
    CPPFLAGS = "-I/opt/homebrew/opt/ffmpeg-full/include";
    HOMEBREW_NO_ANALYTICS = true;
    LDFLAGS= " -L/opt/homebrew/opt/ffmpeg-full/lib";
    PKG_CONFIG_PATH = "/opt/homebrew/opt/ffmpeg-full/lib/pkgconfig";
# 9B36E0149A4EAB28E032F2D382BD733A21368364: Expires in 2027-06-04!
    SOPS_PGP_FP = "9B36E0149A4EAB28E032F2D382BD733A21368364";
    TOMBI_OFFLINE = true;
    TOMBI_NO_CACHE = true;
    XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
  } // (if pkgs.stdenv.isDarwin then {
    SSH_AUTH_SOCK = "${config.home.homeDirectory}/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock";
  } else {
#     SSH_AUTH_SOCK = "${config.home.homeDirectory}/.bitwarden-ssh-agent.sock";
#     SSH_AUTH_SOCK = "${config.home.homeDirectory}/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock";
  });
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.atool
    pkgs.alegreya
    pkgs.alegreya-sans
    pkgs.bat
    pkgs.bchunk
    pkgs.bison
    pkgs.blackout
    pkgs.btop
    pkgs.bzip2
    pkgs.cdrdao
    pkgs.cdrtools
    pkgs.chafa
    pkgs.cmake
    pkgs.colima
    pkgs.coreutils
    pkgs.cuetools
    pkgs.deno
    pkgs.dmtx-utils
    pkgs.docker
    pkgs.docker-compose
    pkgs.docutils
    pkgs.dolphin-emu
    pkgs.dos2unix
    pkgs.exiftool
    pkgs.eza
    pkgs.f3
    pkgs.fastfetch
    pkgs.fdupes
    pkgs.flex
    pkgs.fluidsynth
    pkgs.fontconfig
    pkgs.fzf
    pkgs.geist-font
    pkgs.gettext
    pkgs.gh
    pkgs.gnumake
    pkgs.gpac
    pkgs.hackgen-nf-font
    pkgs.jhead
    pkgs.ia-writer-duospace
    pkgs.ia-writer-mono
    pkgs.ia-writer-quattro
    pkgs.ipafont
    pkgs.ipaexfont
    pkgs.keybase
    pkgs.lazyssh
    pkgs.less
    pkgs.libaacs
    pkgs.libcaca
    pkgs.libplacebo
    pkgs.markdown-toc
    pkgs.meson
    pkgs.nerd-fonts."m+"
    pkgs.nerd-fonts.bigblue-terminal
    pkgs.ninja
    pkgs.nix-zsh-completions
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts-cjk-serif
    pkgs.openjdk
    pkgs.pandoc
    pkgs.paperkey
    pkgs.parallel
    pkgs.pcre2
    pkgs.pkgconf
    pkgs.poppler
    pkgs.qemu
    pkgs.rsync
    pkgs.rtmidi
    pkgs.rustup
    pkgs.rubik
    pkgs.sdl3
    pkgs.shntool
    pkgs.smartmontools
    pkgs.sniglet
    pkgs.sops
    pkgs.timidity
    pkgs.tombi
    pkgs.ueberzugpp
    pkgs.uv
    pkgs.vgmstream
    pkgs.wakeonlan
    pkgs.wget
    pkgs.yt-dlp
    pkgs.zoxide
    pkgs.zilla-slab
    pkgs.zsh
    pkgs.zsh-completions
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ] ++ lib.optionals pkgs.stdenv.isDarwin [
    pkgs.brewCasks.macusb
    pkgs.brewCasks.syntax-highlight
    pkgs.brewCasks.twine-app
    pkgs.brewCasks.zoom
    pkgs.darwin.trash
    pkgs.duti
    pkgs.mas
    pkgs.pam-reattach
    pkgs.pinentry_mac
    pkgs.utm
    pkgs.vlc-bin
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  nixpkgs = {
    overlays = [
      inputs.brew-nix.overlays.default
    ];
  };
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/admin/etc/profile.d/hm-session-vars.sh
  #

  # Let Home Manager install and manage itself.
  programs = {
    home-manager = {
      enable = true;
    };
    git = {
      enable = true;
      ignores = [
        "**/__pycache__/**"
        "**/.DS_Store"
        "**/.env"
        "**/*.log"
        "**/Thumbs.db"
      ];
      settings = {
        commit.gpgsign = true;
        include.path = "${config.home.homeDirectory}/.gitconfig_shared";
        http.postBuffer = 524288000;
        init.defaultBranch = "main";
        pull.ffonly = true;
        tag.gpgsign = true;
      };
    };
    gpg = {
      enable = true;
    };
    tmux = {
      enable = true;
      clock24 = true;
      extraConfig = ''
        bind -T edit-mode-vi WheelDownPane send-keys -X scroll-down
        bind -T edit-mode-vi WheelUpPane send-keys -X scroll-up
        set -g base-index 1
        set -g default-terminal 'tmux-256color'
        set -g mouse on
        set -g pane-active-border-style bg="cyan",fg="black"
        set -g pane-border-lines simple
        set -g prefix C-s
        set -g status-bg black
        set -g status-fg cyan
        set -g status-left '#[fg=white,bg=black]#H#[fg=white]:#[fg=white][#S#[fg=white]][#[default]'
        set -g status-left-length 30
        set -g status-right '#[fg=black,bg=cyan,bold] [%Y-%m-%d (%a) %H:%M]#[default]'
        set -g terminal-overrides 'xterm:colors=256'
        set -g window-active-style 'fg=#F9F7EF,bg=#191919'
        set -g window-style 'fg=colour244,bg=colour235'
        set-option -g renumber-windows on
        setw -g mode-keys vi
        setw -g pane-base-index 1
        setw -g window-status-activity-style bg="cyan","underscore",fg="black"
        unbind C-b
      '';
      prefix = "C-s";
      tmuxinator = {
        projects = {
          quarter = {
            root = "~/Downloads";
            windows = [
              {
                editor = {
                  layout = "tiled";
                  panes = [
                    "clear"
                    "clear"
                    "clear"
                    "clear"
                  ];
                };
              }
            ];
          };
        };
      };
    };
  };
  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };
  };
  xdg = {
    configFile = {
      "btop/themes" = {
        recursive = true;
        source = ./config/btop/themes;
      };
      "homebrew/trust.json" = {
        source = ./config/homebrew/trust.json;
      };
      "mpv" = {
        recursive = true;
        source = ./config/mpv;
      };
      "tmuxinator" = {
        recursive = true;
        source = ./config/tmuxinator;
      };
    };
  };
}
