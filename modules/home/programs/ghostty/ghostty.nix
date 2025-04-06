{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = false;
    enableZshIntegration = true;
    enableBashIntegration = true;
    installVimSyntax = true;
    installBatSyntax = true;
    settings = {
      theme = "gruvbox-material";
      font-family = "Monaspace Neon";
      font-size = 30;
      background-opacity = 0.8;
      background-blur-radius = 70;
      window-padding-y = 10;
      window-padding-x = 10;
      window-decoration = false;
      macos-option-as-alt = true;
      macos-titlebar-style = "hidden";
      macos-window-shadow = true;
    };
  };

  # Uncomment this, once the Nix package is fixed
  xdg.configFile.ghostty = {  
    source = ./config;
    recursive = true;
  };
}
