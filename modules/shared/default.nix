_:
#############################################################
#
#  Shared Module Entry Point
#  Configuration shared across darwin and NixOS
#
#############################################################
{
  imports = [
    ./nix.nix
    ./networking.nix
    ./users.nix
  ];
}
