{ config, pkgs, ... }:

{
  xdg.configFile.ghostty = {  
    source = ./config;
    recursive = true;
  };
}
