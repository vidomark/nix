{ pkgs, ... }:
let
  # broken
  fg = pkgs.fetchFromGitHub {
    owner = "lpnh";
    repo = "fg.yazi";
    rev = "a60466e4a3f54a795a4e719059f0ca98b452cc7e";
    hash = "sha256-K2NdnR1EaIQWvO2KiTTVYUC2eQx2grUrrT24E5S+c6U=";
  };

  system-clipboard = pkgs.fetchFromGitHub {
    owner = "orhnk";
    repo = "system-clipboard.yazi";
    rev = "7775a80e8d3391e0b3da19ba143196960a4efc48";
    hash = "sha256-tfR9XHvRqm7yPbTu/joBDpu908oceaUoBiIImehMobk=";
  };
in
{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
    initLua = ./config/init.lua;
    plugins =
      with pkgs.yaziPlugins;
      {
        inherit
          git
          starship
          smart-filter
          compress
          mediainfo
          full-border
          chmod
        sudo
          rich-preview
          glow
          diff
          ouch
          ;
      }
      // {
        system-clipboard = system-clipboard;
        fg = fg;
      };

    settings = {
      manager = {
        show_hidden = true;
        show_symlink = true;
      };
      plugin = {
        prepend_fetchers = [
          {
            name = "*";
            id = "git";
            run = "git";
          }
          {
            id = "git";
            name = "*/";
            run = "git";
          }
        ];
        prepend_previewers = [
          {
            name = "*.csv";
            run = "rich-preview";
          }
          {
            name = "*.md";
            run = "rich-preview";
          }
          {
            name = "*.rst";
            run = "rich-preview";
          }
          {
            name = "*.ipynb";
            run = "rich-preview";
          }
          {
            name = "*.json";
            run = "rich-preview";
          }
          {
            mime = "application/*zip";
            run = "ouch";
          }
          {
            mime = "application/x-tar";
            run = "ouch";
          }
          {
            mime = "application/x-bzip2";
            run = "ouch";
          }
          {
            mime = "application/x-7z-compressed";
            run = "ouch";
          }
          {
            mime = "application/x-rar";
            run = "ouch";
          }
          {
            mime = "application/vnd.rar";
            run = "ouch";
          }
          {
            mime = "application/x-xz";
            run = "ouch";
          }
          {
            mime = "application/xz";
            run = "ouch";
          }
          {
            mime = "application/x-zstd";
            run = "ouch";
          }
          {
            mime = "application/zstd";
            run = "ouch";
          }
          {
            mime = "application/java-archive";
            run = "ouch";
          }
        ];
      };
    };

    keymap = {
      manager.prepend_keymap = [
        {
          on = "F";
          run = "plugin smart-filter";
          desc = "Smart filter";
        }
        {
          on = "T";
          run = "plugin max-preview";
          desc = "Maximize or restore the preview pane";
        }
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }
        {
          run = "plugin system-clipboard";
          on = "<C-y>";
          desc = "Copy to system-clipboard";
        }
        {
          run = "plugin compress";
          on = [
            "c"
            "a"
          ];
          desc = "Archive selected files";
        }
        {
          run = "plugin fg";
          on = [
            "<Space>"
            "f"
            "g"
          ];
          desc = "Find file by content";
        }
        {
          run = "plugin fg --args='fzf'";
          on = [
            "<Space>"
            "f"
            "f"
          ];
          desc = "Find file by filename";
        }
      ];
    };
  };
}
