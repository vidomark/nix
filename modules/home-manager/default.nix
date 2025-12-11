{ username, homeDirectory, ... }:
{
  imports = [
    ./packages.nix
    ./apps/fonts.nix

    # Shell
    ./apps/shell/zsh.nix

    # Terminals
    ./apps/terminals/ghostty/ghostty.nix
    ./apps/terminals/alacritty.nix
    ./apps/terminals/kitty.nix
    ./apps/terminals/tmux.nix

    # Development
    ./apps/development/git.nix
    ./apps/development/nvim/nvim.nix
    ./apps/development/ideavim/ideavim.nix
    ./apps/development/delta.nix
    ./apps/development/rust-overlay.nix

    # Window Management
    ./apps/window-management/aerospace.nix
    ./apps/window-management/jankyborders.nix

    # Utilities
    ./apps/utilities/bat.nix
    ./apps/utilities/btop.nix
    ./apps/utilities/gpg.nix
    ./apps/utilities/yazi/yazi.nix
    ./apps/utilities/starship.nix
    ./apps/utilities/fzf.nix
    ./apps/utilities/zoxide.nix
    ./apps/utilities/karabiner/karabiner.nix
  ];

  home = {
    inherit homeDirectory username;
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
