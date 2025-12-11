{ username, homeDirectory, ... }:
{
  imports = [
    ./profiles/development.nix
  ];

  home = {
    inherit homeDirectory username;
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
