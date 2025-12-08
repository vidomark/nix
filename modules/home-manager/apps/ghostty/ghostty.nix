{
  config,
  lib,
  ...
}:
{
  options.apps.ghostty = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether to enable Ghostty via Nix package (use false for Homebrew)";
    };
  };

  config = lib.mkMerge [
    # Official Nix package
    (lib.mkIf config.apps.ghostty.enable {
      programs.ghostty = {
        enable = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
        installVimSyntax = true;
        installBatSyntax = true;
        settings = {
          theme = "gruvbox-material";
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
    })

    # Custom config for Homebrew ghostty (when Nix package disabled)
    (lib.mkIf (!config.apps.ghostty.enable) {
      xdg.configFile.ghostty = {
        source = ./config;
        recursive = true;
      };
    })
  ];
}
