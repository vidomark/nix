{
  config,
  lib,
  ...
}:
{
  options.apps.nvim = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to enable Neovim configuration";
    };
  };

  config = lib.mkIf config.apps.nvim.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };

    xdg.configFile.nvim = {
      source = ./config;
      recursive = true;
    };
  };
}
