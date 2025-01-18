{ pkgs, config, ... }:
let
  sessionx = pkgs.tmuxPlugins.mkTmuxPlugin 
    {
      pluginName = "sessionx";
      version = "0711d03";
      src = pkgs.fetchFromGitHub {
        owner = "omerxx";
        repo = "tmux-sessionx";
        rev = "0711d0374fe0ace8fd8774396469ab34c5fbf360";
        sha256 = "sha256-9IhXoW9o/ftbhIree+I3vT6r3uNgkZ7cskSyedC3xG4=";
      };
    };

  floax = pkgs.tmuxPlugins.mkTmuxPlugin 
    {
      pluginName = "floax";
      version = "864ceb9";
      src = pkgs.fetchFromGitHub {
        owner = "omerxx";
        repo = "tmux-floax";
        rev = "864ceb9372cb496eda704a40bb080846d3883634";
        sha256 = "sha256-vG8UmqYXk4pCvOjoSBTtYb8iffdImmtgsLwgevTu8pI=";
      };
    };
in
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    prefix = "C-Space";
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";
    historyLimit = 100000;
    plugins = with pkgs;
      [
        tmuxPlugins.better-mouse-mode
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.tmux-fzf
        floax
        {
          plugin = sessionx;
          extraConfig = ''
            set-environment -g TMUX_PLUGIN_MANAGER_PATH "${config.home.homeDirectory}/.tmux/plugins"
          '';
        }
        {
            plugin = tmuxPlugins.resurrect;
            extraConfig = ''
            set -g @resurrect-strategy-vim 'session'
            set -g @resurrect-strategy-nvim 'session'
            set -g @resurrect-capture-pane-contents 'on'
            '';
        }
        tmuxPlugins.tmux-thumbs
        {
            plugin = tmuxPlugins.continuum;
            extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-boot 'on'
            set -g @continuum-save-interval '10'
            '';
        }
        {
          plugin = tmuxPlugins.catppuccin;
          extraConfig = ''
            set -g @catppuccin_flavour 'mocha'
            set -g @catppuccin_window_left_separator ""
            set -g @catppuccin_window_right_separator " "
            set -g @catppuccin_window_middle_separator " █"
            set -g @catppuccin_window_number_position "right"
            set -g @catppuccin_window_default_fill "number"
            set -g @catppuccin_window_default_text "#W"
            set -g @catppuccin_window_current_fill "number"
            set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
            set -g @catppuccin_status_modules_right "directory meetings date_time"
            set -g @catppuccin_status_modules_left "session"
            set -g @catppuccin_status_left_separator  " "
            set -g @catppuccin_status_right_separator " "
            set -g @catppuccin_status_right_separator_inverse "no"
            set -g @catppuccin_status_fill "icon"
            set -g @catppuccin_status_connect_separator "no"
            set -g @catppuccin_directory_text "#{b:pane_current_path}"
            set -g @catppuccin_meetings_text "#($HOME/.config/tmux/scripts/cal.sh)"
            set -g @catppuccin_date_time_text "%H:%M"
          '';
        }
      ];
    extraConfig = ''
      bind i choose-tree -Zs
      bind -r Down resize-pane -D 5
      bind -r Up resize-pane -U 5
      bind -r Right resize-pane -R 5
      bind -r Left resize-pane -L 5
      bind s split-window -v -c "#{pane_current_path}"
      bind v split-window -h -c "#{pane_current_path}"
      bind-key j previous-window
      bind-key k next-window
      bind-key -n F4 copy-mode
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
      bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "pbcopy"
      bind-key & kill-window
      bind-key x kill-pane

      set -g detach-on-destroy on
      set -g set-clipboard on 
      set -g status-position top
      set -g mouse on
      set -g status-bg default
      set -g status-style bg=default
      set -g pane-active-border-style fg=colour250
      set -g status-bg default
      set -g status-style bg=default
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM
      set -gu default-command
      set -g default-shell "$SHELL"
    '';
  };
}
