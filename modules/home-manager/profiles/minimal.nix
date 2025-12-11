{ pkgs, lib, ... }:
#############################################################
#
#  Minimal Profile
#  Essential tools for any machine (server, secondary, etc.)
#
#############################################################
{
  imports = [
    ../packages/fonts.nix
    ../packages/shell/zsh.nix
    ../packages/utilities/bat.nix
    ../packages/utilities/fzf.nix
    ../packages/utilities/zoxide.nix
    ../packages/utilities/starship.nix
    ../packages/utilities/gpg.nix
    ../packages/utilities/karabiner/karabiner.nix
    ../packages/development/git.nix
  ];

  home.packages = with pkgs; [
    # Archives
    zip
    unzip

    # Core utilities
    ripgrep
    jq
    yq-go
    fd
    curl
    wget
    htop
    lsd
    tldr
    tree

    # System tools
    file
    which
  ];
}
