{ config, pkgs, ... }:

{
  xdg.configFile.ideavim = {  
    source = ./config;
    recursive = true;
  };
}
