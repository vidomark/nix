{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      lg = "lazygit";
      vim = "nvim";
      ls = "lsd";
      cd = "z";
      cat = "bat";
      grep = "batgrep";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "command-not-found"
        "history"
        "sudo"
      ];
    };

    history = {
      expireDuplicatesFirst = true;
      save = 100000000;
      size = 1000000000;
    };
    initContent = ''
      ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

      zvm_after_init() {
        if [ -f "${pkgs.fzf}/share/fzf/key-bindings.zsh" ]; then
          source "${pkgs.fzf}/share/fzf/key-bindings.zsh"
        fi
        if [ -f "${pkgs.fzf}/share/fzf/completion.zsh" ]; then
          source "${pkgs.fzf}/share/fzf/completion.zsh"
        fi
      }

      if command -v batman &> /dev/null; then
        eval "$(${pkgs.bat-extras.core}/bin/batman --export-env)"
      fi

      zstyle ':completion:*:git-checkout:*' sort false
      # set descriptions format to enable group support
      # NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
      zstyle ':completion:*:descriptions' format '[%d]'
      # set list-colors to enable filename colorizing
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
      zstyle ':completion:*' menu no
      # preview directory's content with eza when completing cd
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
      # custom fzf flags
      # NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
      # To make fzf-tab follow FZF_DEFAULT_OPTS.
      zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
      # NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
      zstyle ':fzf-tab:*' use-fzf-default-opts yes
      # switch group using `<` and `>`
      zstyle ':fzf-tab:*' switch-group '<' '>'
      zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

      if [ -z "$INTELLIJ_ENVIRONMENT_READER" ] && command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
        exec tmux
      fi
    '';

    plugins = with pkgs; [
      {
        name = "zsh-vi-mode";
        src = fetchFromGitHub {
          owner = "jeffreytse";
          repo = "zsh-vi-mode";
          rev = "cd730cd347dcc0d8ce1697f67714a90f07da26ed";
          sha256 = "sha256-UQo9shimLaLp68U3EcsjcxokJHOTGhOjDw4XDx6ggF4=";
        };
      }
      {
        name = "zsh-completions";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-completions";
          rev = "0.27.0";
          sha256 = "1c2xx9bkkvyy0c6aq9vv3fjw7snlm0m5bjygfk5391qgjpvchd29";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.6.0";
          sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
        };
        file = "zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-autopair";
        src = fetchFromGitHub {
          owner = "hlissner";
          repo = "zsh-autopair";
          rev = "34a8bca0c18fcf3ab1561caef9790abffc1d3d49";
          sha256 = "1h0vm2dgrmb8i2pvsgis3lshc5b0ad846836m62y8h3rdb3zmpy1";
        };
        file = "autopair.zsh";
      }
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "6aced3f35def61c5edf9d790e945e8bb4fe7b305";
          sha256 = "sha256-EWMeslDgs/DWVaDdI9oAS46hfZtp4LHTRY8TclKTNK8=";
        };
      }
      {
        name = "forgit";
        src = pkgs.fetchFromGitHub {
          owner = "wfxr";
          repo = "forgit";
          rev = "7a40a11e795f42c851eefbb2fd39419383c66ccd";
          sha256 = "sha256-nFXouj2e0oyN9p4/pZlVa3vsSoJ3zJesHKY22V4eLKA=";
        };
      }
    ];
  };
}
