{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ yazi ];

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
    settings = {
      show_hidden = true;
    };
  };
}
