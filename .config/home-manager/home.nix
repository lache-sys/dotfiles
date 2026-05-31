{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "admin";
  home.homeDirectory = "/Users/admin";
  home.sessionVariables = {
    HOMEBREW_NO_ANALYTICS = true;
    TOMBI_OFFLINE = true;
    TOMBI_NO_CACHE = true;
    XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
  } // (if pkgs.stdenv.isDarwin then {
    SSH_AUTH_SOCK="${config.home.homeDirectory}/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock";
  } else {
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
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    atool
    alegreya
    alegreya-sans
    bash
    bash-completion
    bat
    bchunk
    bitwarden-cli
    bison
    blackout
    btop
    bzip2
    cdrdao
    cdrtools
    chafa
    cmake
    coreutils
    cuetools
    darwin.trash
    deno
    dmtx-utils
    docker
    docker-compose
    dos2unix
    duti
    exiftool
    eza
    f3
    fastfetch
    fdupes
    ffmpeg-full
    flex
    fluidsynth
    fontconfig
    fzf
    gettext
    gh
    gnumake
    gpac
    hackgen-nf-font
    highlight
    jhead
    ia-writer-duospace
    ia-writer-mono
    ia-writer-quattro
    ipafont
    ipaexfont
    lazyssh
    less
    libaacs
    libcaca
    mas
    markdown-toc
    nerd-fonts.bigblue-terminal
    ninja
    nix-zsh-completions
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    pam-reattach
    pandoc
    paperkey
    parallel
    pcre2
    pinentry_mac
    pkgconf
    poppler
    qemu
    ranger
    rsync
    rtmidi
    rustup
    rubik
    sdl3
    shntool
    smartmontools
    sniglet
    timidity
    tombi
    ueberzugpp
    utm
    uv
    vlc-bin
    vgmstream
    wakeonlan
    wget
    yt-dlp
    zoxide
    zilla-slab
    zsh
    zsh-completions

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
        ".DS_Store"
        "Thumbs.db"
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
    };
    vim = {
      enable = true;
      defaultEditor = true;
      plugins = with pkgs.vimPlugins; [
        fzf-wrapper
        vim-nix
        nerdtree
        rainbow
        vim-nerdtree-syntax-highlight
      ];
      settings = {
      };
      extraConfig = ''
        hi Comment ctermfg=3
        nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
        nnoremap <silent> <C-j> :bprev<CR>
        nnoremap <silent> <C-k> :bnext<CR>
        set ambiwidth=double
        set backspace=indent,eol,start
        set cinoptions+=:0
        set clipboard=unnamed,autoselect
        set cmdheight=2
        set display=lastline
        set encoding=utf-8
        set expandtab
        set fileencodings=utf-8,sjis
        set guioptions+=R
        set guioptions+=a
        set guioptions-=T
        set guioptions-=m
        set hidden
        set history=10000
        set hlsearch
        set ignorecase
        set incsearch
        set laststatus=2
        set linespace=4
        set list
        set listchars=eol:$,tab:^\ ,trail:~
        set mouse=a
        set nobackup
        set noerrorbells
        set nofoldenable
        set noswapfile
        set nowritebackup
        set nrformats=
        set number
        set relativenumber
        set shellslash
        set shiftwidth=2
      '';
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
