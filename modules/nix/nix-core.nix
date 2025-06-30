{ pkgs, lib, ... }:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.nix-daemon.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix.package = pkgs.nix;

  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 7d";
  };

  # Disable auto-optimise-store because of this issue:
  #   https://github.com/NixOS/nix/issues/7273
  # "error: cannot link '/nix/store/.tmp-link-xxxxx-xxxxx' to '/nix/store/.links/xxxx': File exists"
  nix.settings = {
    auto-optimise-store = false;
  };
}
