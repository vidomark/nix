{ config, pkgs, ... }:

{
  # home.packages = with pkgs; [ neovim ];

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
