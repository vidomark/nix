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
    ./programs/yabai.nix
    ./programs/btop.nix
    ./programs/ideavim/ideavim.nix
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
