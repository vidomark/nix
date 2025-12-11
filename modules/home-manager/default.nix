{ username, homeDirectory, ... }:
{
  imports = [
    ./packages/core.nix
    ./packages/fonts.nix

    # Shell
    ./packages/shell/zsh.nix

    # Terminals
    ./packages/terminals/ghostty/ghostty.nix
    ./packages/terminals/alacritty.nix
    ./packages/terminals/kitty.nix
    ./packages/terminals/tmux.nix

    # Development
    ./packages/development/git.nix
    ./packages/development/nvim/nvim.nix
    ./packages/development/ideavim/ideavim.nix
    ./packages/development/delta.nix
    ./packages/development/rust-overlay.nix

    # Window Management
    ./packages/window-management/aerospace.nix
    ./packages/window-management/jankyborders.nix

    # Utilities
    ./packages/utilities/bat.nix
    ./packages/utilities/btop.nix
    ./packages/utilities/gpg.nix
    ./packages/utilities/yazi/yazi.nix
    ./packages/utilities/starship.nix
    ./packages/utilities/fzf.nix
    ./packages/utilities/zoxide.nix
    ./packages/utilities/karabiner/karabiner.nix
  ];

  home = {
    inherit homeDirectory username;
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
