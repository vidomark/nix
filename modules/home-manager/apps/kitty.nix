{ ... }:
{
  programs.kitty = {
    enable = true;

    themeFile = "GruvboxMaterialDarkHard";

    font = {
      name = "ComicShannsMono Nerd Font Mono";
      size = 32;
    };

    settings = {
      enable_audio_bell = false;
      window_padding_width = 5;
      background_opacity = 0.9;
      background_blur = 65;
      hide_window_decorations = true;
      initial_window_width = 4000;
      initial_window_height = 1200;
      macos_option_as_alt = true;
      cursor_trail = 3;
    };

    keybindings = {
      "ctrl+w" = "noop";
    };
  };
}
