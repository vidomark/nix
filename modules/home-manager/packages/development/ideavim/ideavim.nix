{
  config,
  lib,
  ...
}:
{
  options.apps.ideavim = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to enable IdeaVim configuration";
    };
  };

  config = lib.mkIf config.apps.ideavim.enable {
    xdg.configFile.ideavim = {
      source = ./config;
      recursive = true;
    };
  };
}
