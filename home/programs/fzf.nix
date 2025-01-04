{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fzf
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
  };
}
