{ config, pkgs, ... }:

{
  programs = {
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
      plugins = [
        {
          plugin = pkgs.tmuxPlugins.tmux-thumbs;
          extraConfig = ''
            set -g @thumbs-command 'tmux set-buffer -- {} && tmux display-message "Copied {}"'
          '';
        }
      ];
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
}
