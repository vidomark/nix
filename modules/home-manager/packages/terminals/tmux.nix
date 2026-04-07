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
      tmuxPlugins.gruvbox
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.tmux-fzf
      tmuxPlugins.copy-toolkit
      tmuxPlugins.tmux-floax
      tmuxPlugins.tmux-sessionx
      tmuxPlugins.yank
      tmuxPlugins.tmux-which-key
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

      set -g status-keys vi
      set -g detach-on-destroy on
      set -g set-clipboard on
      set -g status-position top
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
