{ pkgs, username, ... }:

{
  imports = [
    ./core.nix
    ./programs/zsh.nix
    ./programs/git.nix
    ./programs/ghostty/ghostty.nix
    ./programs/alacritty.nix
    ./programs/kitty.nix
    ./programs/tmux.nix
    ./programs/nvim/nvim.nix
    ./programs/starship.nix
    ./programs/fzf.nix
    ./programs/zoxide.nix
    ./programs/bat.nix
    ./programs/btop.nix
    ./programs/gpg.nix
    ./programs/rust-overlay.nix
    ./programs/yazi/yazi.nix
    ./programs/karabiner/karabiner.nix
    ./programs/ideavim/ideavim.nix
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
