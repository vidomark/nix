_:
#############################################################
#
#  Darwin Module Entry Point
#  macOS-specific system configuration
#
#############################################################
{
  imports = [
    ./system.nix
    ./homebrew.nix
  ];
}
