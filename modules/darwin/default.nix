{ flake, ... }:
let
  inherit (flake) config inputs;
  inherit (inputs) self;
in
{
  imports = [
    {
      home = "/Users/${config.user.username}";
      users.users.${config.user.username} = {
      };
      home-manager.users.${config.user.username} = { };
      home-manager.sharedModules = [
        self.homeModules.default
      ];
    }
    self.nixosModules.common
    self.nix-homebrew.darwinModules.nix-homebrew
    {
      nix-homebrew = {
        enableRosetta = true;
        enable = true;
        user = ${config.user.username};
        taps = {
          "homebrew/homebrew-core" = homebrew-core;
          "homebrew/homebrew-cask" = homebrew-cask;
          "homebrew/homebrew-bundle" = homebrew-bundle;
        };
      };
    }
  ];
}
