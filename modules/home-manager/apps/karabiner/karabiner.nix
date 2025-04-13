{ pkgs, config, lib, ... }:
{
  options.apps.karabiner = {
    enable = lib.mkEnableOption "Karabiner-Elements configuration";
  };

  config = lib.mkIf (pkgs.stdenv.hostPlatform.isDarwin && config.apps.karabiner.enable) {
    xdg.configFile.karabiner = {
      source = ./config;
      recursive = true;
    };
  };
}
