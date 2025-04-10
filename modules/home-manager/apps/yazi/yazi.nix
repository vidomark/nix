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
      plugin.prepend_fetchers = [
        {
          id = "git";
          name = "*";
          run = "git";
        }
        {
          id = "git";
          name = "*/";
          run = "git";
        }
      ];
    };
    keymap = {
        manager.prepend_keymap = [
          {
            on = "T";
            run = "plugin max-preview";
            desc = "Maximize or restore the preview pane";
          }
          {
            on = ["c" "m"];
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
            on = ["c" "a"];
            desc = "Archive selected files";
          }
          {
            run = "plugin fg";
            on = ["f" "g"];
            desc = "Find file by content";
          }
          {
            run = "plugin fg --args='fzf'";
            on = ["f" "f"];
            desc = "Find file by filename";
          }
        ];
      };
    plugins = {
      git = "${yazi-plugins}/git.yazi";
      chmod = "${yazi-plugins}/chmod.yazi";
			full-border = "${yazi-plugins}/full-border.yazi";
      max-preview = "${yazi-plugins}/max-preview.yazi";
      starship = starship;
      fg = fg;
      system-clipboard = system-clipboard;
      compress = compress;
    };
  };
}

