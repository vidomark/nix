{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.apps.karabiner = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = pkgs.stdenv.hostPlatform.isDarwin;
      description = "Whether to enable Karabiner-Elements configuration";
    };
  };

  config = lib.mkIf config.apps.karabiner.enable {
    xdg.configFile.karabiner = {
      source = ./config;
      recursive = true;
    };
  };
}
