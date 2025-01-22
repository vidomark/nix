{ config, pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
  };

  xdg.configFile.nvim = {  
    source = ./config;
    recursive = true;
  };
}
