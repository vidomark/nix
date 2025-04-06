{ lib, flake, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.darwinModules.default
    ./system.nix
    ./apps.nix
  ];

  # nixos-unified.sshTarget = "srid@infinitude";

  networking.hostName = "aarch64-darwin";
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}



