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
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

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

    nixos-unified.url = "github:srid/nixos-unified";

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    
    yazi.url = "github:sxyazi/yazi";
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
  };

  outputs = inputs@{ self, ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
      imports = (with builtins;
        map
          (fn: ./modules/flake-parts/${fn})
          (attrNames (readDir ./modules/flake-parts)));

      perSystem = { lib, system, ... }: {
        # Make our overlay available to the devShell
        # "Flake parts does not yet come with an endorsed module that initializes the pkgs argument.""
        # So we must do this manually; https://flake.parts/overlays#consuming-an-overlay
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = lib.attrValues self.overlays;
          config.allowUnfree = true;
        };
      };

      # https://omnix.page/om/ci.html
      # flake.om.ci.default.ROOT = {
      #   dir = ".";
      #   steps.flake-check.enable = false; # Doesn't make sense to check nixos config on darwin!
      #   steps.custom = { };
      # };
    };


  # outputs = inputs @ {
  #   self,
  #   nixpkgs,
  #   darwin,
  #   home-manager,
  #   nix-homebrew,
  #   homebrew-core,
  #   homebrew-cask,
  #   homebrew-bundle,
  #   rust-overlay,
  #   alacritty-theme,
  #   yazi,
  #   ...
  # }: let
  #   username = "vido.mark";
  #   useremail = "vidomark42@gmail.com";
  #   system = "aarch64-darwin";
  #   hostname = "aarch64-darwin";
  #   pkgs = import nixpkgs {
  #     inherit system;
  #     overlays = [
  #       alacritty-theme.overlays.default
  #       yazi.overlays.default
  #       rust-overlay.overlays.default
  #       # (import (builtins.fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz"))
  #     ];
  #   };
  #   specialArgs =
  #     inputs
  #     // {
  #       inherit username useremail hostname;
  #     };
  # in {
  #   darwinConfigurations."${hostname}" = darwin.lib.darwinSystem {
  #     inherit pkgs system specialArgs;
  #     modules = [
  #       ./modules/nix-core.nix
  #       ./modules/host-users.nix
  #       ./modules/darwin
  #
  #       home-manager.darwinModules.home-manager
  #       {
  #         home-manager.useGlobalPkgs = true;
  #         home-manager.useUserPackages = true;
  #         home-manager.extraSpecialArgs = specialArgs;
  #         home-manager.users.${username} = import ./home-manager;
  #
  #       }
  #       nix-homebrew.darwinModules.nix-homebrew
  #       {
  #         nix-homebrew = {
  #           enableRosetta = true;
  #           enable = true;
  #           user = username;
  #           taps = {
  #             "homebrew/homebrew-core" = homebrew-core;
  #             "homebrew/homebrew-cask" = homebrew-cask;
  #             "homebrew/homebrew-bundle" = homebrew-bundle;
  #           };
  #         };
  #       }
  #     ];
  #   };
  # };
}
