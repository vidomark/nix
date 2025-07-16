{ pkgs, ... }:
let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "e4aaf430ad7f81d2e358e3a60525c8ef3fa259fc";
    hash = "sha256-dIj2YgLN04nFxmw7I/sdbJY2QCs+Nmb4eUtfLlPL53E=";
  };

  starship = pkgs.fetchFromGitHub {
    owner = "Rolv-Apneseth";
    repo = "starship.yazi";
    rev = "af8bf6f82165b83272b6501ce7445cf2c61fbf51";
    hash = "sha256-L7MkZZqJ+t+A61ceC4Q1joLF6ytoWdgx9BwZWAGAoCA=";
  };

  rich-preview = pkgs.fetchFromGitHub {
    owner = "AnirudhG07";
    repo = "rich-preview.yazi";
    rev = "8be4d27ee044ce6b9b28c0c4ff544482423dbbbf";
    hash = "sha256-TwL0gIcDhp0hMnC4dPqaVWIXhghy977DmZ+yPoF/N98=";
  };

  glow = pkgs.fetchFromGitHub {
    owner = "Reledia";
    repo = "glow.yazi";
    rev = "602ee6b844fc04b8ebc34356c1b228d4af18972b";
    hash = "sha256-lr/7KidjNFyahINURiy1NbK+cUMxIWH30Guz0yyj+Wg=";
  };

  ouch = pkgs.fetchFromGitHub {
    owner = "ndtoan96";
    repo = "ouch.yazi";
    rev = "083d5647345c8d2119d50860aabca57d292ab672";
    hash = "sha256-zLAaJrcZGNWlG2HjsZtN4u8JZAN+GLl2RtP9qCt3T74=";
  };

  fg = pkgs.fetchFromGitHub {
    owner = "lpnh";
    repo = "fg.yazi";
    rev = "9bba7430dbcd30995deea600499b069fe6067a3e";
    hash = "sha256-3VjTL/q4gSDIHyPXwUIQA/26bbhWya+01EZbxSKzzQo=";
  };

  system-clipboard = pkgs.fetchFromGitHub {
    owner = "orhnk";
    repo = "system-clipboard.yazi";
    rev = "7775a80e8d3391e0b3da19ba143196960a4efc48";
    hash = "sha256-tfR9XHvRqm7yPbTu/joBDpu908oceaUoBiIImehMobk=";
  };

  compress = pkgs.fetchFromGitHub {
    owner = "KKV9";
    repo = "compress.yazi";
    rev = "60b24af23d1050f1700953a367dd4a2990ee51aa";
    hash = "sha256-Yf5R3H8t6cJBMan8FSpK3BDSG5UnGlypKSMOi0ZFqzE=";
  };
in
{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
    initLua = ./config/init.lua;
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
    plugins = {
      git = "${yazi-plugins}/git.yazi";
      smart-filter = "${yazi-plugins}/smart-filter.yazi";
      chmod = "${yazi-plugins}/chmod.yazi";
      full-border = "${yazi-plugins}/full-border.yazi";
      max-preview = "${yazi-plugins}/max-preview.yazi";
      rich-preview = rich-preview;
      ouch = ouch;
      glow = glow;
      system-clipboard = system-clipboard;
      starship = starship;
      fg = fg;
      compress = compress;
    };
  };
}
