{ config, lib, pkgs, ... }:

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
    initExtra = ''
      bindkey '^ ' autosuggest-accept

      ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

      zvm_after_init() {
        if [ -f "${pkgs.fzf}/share/fzf/key-bindings.zsh" ]; then
          source "${pkgs.fzf}/share/fzf/key-bindings.zsh"
        fi
        if [ -f "${pkgs.fzf}/share/fzf/completion.zsh" ]; then
          source "${pkgs.fzf}/share/fzf/completion.zsh"
        fi
      }

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
      {
        name = "formarks";
        src = fetchFromGitHub {
          owner = "wfxr";
          repo = "formarks";
          rev = "8abce138218a8e6acd3c8ad2dd52550198625944";
          sha256 = "1wr4ypv2b6a2w9qsia29mb36xf98zjzhp3bq4ix6r3cmra3xij90";
        };
        file = "formarks.plugin.zsh";
      }
    ];
  };
}
