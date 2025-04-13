{
  description = "Nix for macOS configuration";

  ##################################################################################################################
  #
  # Want to know Nix in details? Looking for a beginner-friendly tutorial?
  # Check out https://github.com/ryan4yin/nixos-and-flakes-book !
  #
  ##################################################################################################################

  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {
    substituters = [
      # Query the mirror of USTC first, and then the official cache.
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
  };

  inputs = {
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.11-darwin";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:Homebrew/homebrew-cask";
      flake = false;
    };

    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    yazi.url = "github:sxyazi/yazi";
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    darwin,
    home-manager,
    nix-homebrew,
    homebrew-core,
    homebrew-cask,
    homebrew-bundle,
    rust-overlay,
    alacritty-theme,
    yazi,
    ...
  }: let
    username = "vido.mark";
    useremail = "vidomark42@gmail.com";
    system = "aarch64-darwin";
    homeDirectory = "/Users/${username}";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        alacritty-theme.overlays.default
        yazi.overlays.default
        rust-overlay.overlays.default
      ];
    };
    specialArgs =
      inputs
      // {
        inherit username useremail system homeDirectory;
      };
  in {
    darwinConfigurations."${system}" = darwin.lib.darwinSystem {
      inherit pkgs system specialArgs;
      modules = [
        ./modules/system
        ./modules/darwin
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users.${username} = import ./modules/home-manager;

        }
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enableRosetta = true;
            enable = true;
            user = username;
            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
              "homebrew/homebrew-bundle" = homebrew-bundle;
            };
          };
        }
      ];
    };

    homeConfigurations = {
      ${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./modules/home-manager
        ];
        extraSpecialArgs = {
          inherit specialArgs;
        };
      };
    };
  };
}
