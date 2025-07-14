{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    prefix = "C-Space";
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";
    historyLimit = 100000;
    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.tmux-fzf
      tmuxPlugins.copy-toolkit
      tmuxPlugins.tmux-floax
      tmuxPlugins.tmux-sessionx
      tmuxPlugins.yank
      tmuxPlugins.tmux-which-key
      tmuxPlugins.better-mouse-mode
      {
        plugin = tmuxPlugins.fuzzback;
        extraConfig = ''
          set -g @fuzzback-popup 0
          set -g @fuzzback-finder-bind 'ctrl-s:toggle-sort'
          set -g @fuzzback-popup-size '90%'
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
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '10'
        '';
      }
      {
        plugin = tmuxPlugins.tokyo-night-tmux;
        extraConfig = ''
          set -g @tokyo-night-tmux_transparent 1
          set -g @tokyo-night-tmux_window_id_style digital
          set -g @tokyo-night-tmux_pane_id_style hsquare
          set -g @tokyo-night-tmux_zoom_id_style dsquare
          set -g @tokyo-night-tmux_terminal_icon 
          set -g @tokyo-night-tmux_active_terminal_icon 
          set -g @tokyo-night-tmux_window_tidy_icons 1
          set -g @tokyo-night-tmux_show_datetime 0
          set -g @tokyo-night-tmux_show_hostname 1
          set -g @tokyo-night-tmux_show_path 1
          set -g @tokyo-night-tmux_path_format relative
        '';
      }
      # {
      #   plugin = tmuxPlugins.catppuccin;
      #   extraConfig = ''
      #     set -g @catppuccin_flavour 'mocha'
      #     set -g @catppuccin_window_left_separator ""
      #     set -g @catppuccin_window_right_separator " "
      #     set -g @catppuccin_window_middle_separator " █"
      #     set -g @catppuccin_window_number_position "right"
      #     set -g @catppuccin_window_default_fill "number"
      #     set -g @catppuccin_window_default_text "#W"
      #     set -g @catppuccin_window_current_fill "number"
      #     set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
      #     set -g @catppuccin_status_modules_right "directory meetings date_time"
      #     set -g @catppuccin_status_modules_left "session"
      #     set -g @catppuccin_status_left_separator  " "
      #     set -g @catppuccin_status_right_separator " "
      #     set -g @catppuccin_status_right_separator_inverse "no"
      #     set -g @catppuccin_status_fill "icon"
      #     set -g @catppuccin_status_connect_separator "no"
      #     set -g @catppuccin_directory_text "#{b:pane_current_path}"
      #     set -g @catppuccin_meetings_text "#($HOME/.config/tmux/scripts/cal.sh)"
      #     set -g @catppuccin_date_time_text "%H:%M"
      #   '';
      # }
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
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM
      set -gu default-command
      set -g default-shell "$SHELL"
    '';
  };
}
