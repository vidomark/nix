{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ yabai ];
}
