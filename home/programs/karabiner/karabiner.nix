
{ config, pkgs, ... }:

{
  xdg.configFile.karabiner = {  
    source = ./config;
    recursive = true;
  };
}
