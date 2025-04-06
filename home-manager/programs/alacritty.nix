{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        import = [ pkgs.alacritty-theme.gruvbox_material_hard_dark ];
      };
      window = {
        dimensions = {
          lines = 80;
          columns = 300;
        };
        padding = {
          x = 10;
          y = 10;
        };
        decorations = "Buttonless";
        opacity = 0.7;
        blur = true;
        option_as_alt = "Both";
      };

      font = {
        size = 29;
        normal.family = "Hack Nerd Font Mono";
      };

      env.TERM = "xterm-256color";
    };
  };
}
