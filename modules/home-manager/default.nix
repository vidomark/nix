{ username, homeDirectory, ... }:
{
  imports = [
    ./core.nix
    ./apps/zsh.nix
    ./apps/git.nix
    ./apps/ghostty/ghostty.nix
    ./apps/alacritty.nix
    ./apps/kitty.nix
    ./apps/tmux.nix
    ./apps/aerospace.nix
    ./apps/jankyborders.nix
    ./apps/nvim/nvim.nix
    ./apps/starship.nix
    ./apps/fzf.nix
    ./apps/zoxide.nix
    ./apps/bat.nix
    ./apps/btop.nix
    ./apps/gpg.nix
    ./apps/rust-overlay.nix
    ./apps/yazi/yazi.nix
    ./apps/karabiner/karabiner.nix
    ./apps/ideavim/ideavim.nix
  ];

  home = {
    inherit homeDirectory;
    username = username;
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
