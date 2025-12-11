{ pkgs, lib, ... }:
#############################################################
#
#  Development Profile
#  Full development environment for workstations
#
#############################################################
{
  imports = [
    ./minimal.nix

    # Terminals
    ../packages/terminals/ghostty/ghostty.nix
    ../packages/terminals/alacritty.nix
    ../packages/terminals/kitty.nix
    ../packages/terminals/tmux.nix

    # Development tools
    ../packages/development/nvim/nvim.nix
    ../packages/development/ideavim/ideavim.nix
    ../packages/development/delta.nix
    ../packages/development/rust-overlay.nix

    # Additional utilities
    ../packages/utilities/btop.nix
    ../packages/utilities/yazi/yazi.nix

    # Window management
    ../packages/window-management/aerospace.nix
    ../packages/window-management/jankyborders.nix
  ];

  home.packages = with pkgs; [
    # Programming Languages
    nodejs_20
    jdk21
    python3
    go
    lua
    gcc

    # Build tools
    maven
    gradle
    quarkus

    # Dev utilities
    sqlcmd
    nixfmt-rfc-style
    ripgrep-all
    tree-sitter
    diff-so-fancy
    direnv
    openssl
    nmap

    # Misc
    checkstyle
    rich-cli
    glow
    stow
    lesspipe
    clipboard-jh
    zsh-vi-mode
  ]
  ++ (lib.optionals pkgs.stdenv.isDarwin [
    mas
    rectangle
  ]);

  home.sessionVariables = {
    LESSOPEN = "|lesspipe.sh %s";
  };
}
