{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ kitty ];
  
  programs.kitty = {
    enable = true;

    themeFile = "GruvboxMaterialDarkHard";

    font = {
      name = "Hack Nerd Font Mono";
      size = 30;
    };

    settings = {
      enable_audio_bell = false;
      window_padding_width = 10;
      background_opacity = "0.7";
      background_blur = 65;
      hide_window_decorations = true;
      initial_window_width = 4000;
      initial_window_height = 1200;
      macos_option_as_alt = true;
    };

    keybindings = {
      "ctrl+w" = "noop";
    };
  };
}
