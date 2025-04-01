{ pkgs, ... }: {

  ##########################################################################
  # 
  #  Install all apps and packages here.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true; # Fetch the newest stable branch of Homebrew's git repo
      upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
      # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
      # cleanup = "zap";
    };

    # Applications to install from Mac App Store using mas.
    # You need to install all these Apps manually first so that your apple account have records for them.
    # otherwise Apple Store will refuse to install them.
    # For details, see https://github.com/mas-cli/mas 
    masApps = {
      "MicrosoftExcel" = 462058435;
      "MicrosoftWord" = 462054704;
      "MicrosoftPowerPoint" = 462062816;
      "DarkReader" = 1438243180;
    };

    taps = [
      "homebrew/services"
      "homebrew/cask"
    ];

    brews = [
      "mas"
    ];

    casks = [
      "firefox"
      "google-chrome"
      "arc"
      "spotify"
      "homerow"
      "adobe-acrobat-reader"
      "google-drive"

      "raycast"
      "stats"
      "font-monaspace"
      "karabiner-elements"
      "kindavim"
      "hammerspoon"
      "obsidian"
      "logi-options+"

      "alacritty"
      "kitty"
      "wezterm"
      "ghostty"

      "wireshark"
      "postman"
      "drawio"
    ];
  };
}
