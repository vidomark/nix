# Nix Darwin Configuration

Personal macOS system configuration using [nix-darwin](https://github.com/LnL7/nix-darwin) and [home-manager](https://github.com/nix-community/home-manager).

## Quick Start

```bash
# Apply full system configuration (requires nix-darwin)
darwin-rebuild switch --flake .#macbook

# Apply home-manager only (standalone)
home-manager switch --flake .#vido.mark
```

## Structure

```
.
├── flake.nix                     # Entry point - inputs, outputs, overlays
├── modules/
│   ├── darwin/                   # macOS-specific system configuration
│   │   ├── default.nix           # Darwin module entry point
│   │   ├── system.nix            # System defaults (dock, finder, keyboard)
│   │   └── homebrew.nix          # Homebrew casks and Mac App Store apps
│   ├── shared/                   # Configuration shared across systems
│   │   ├── default.nix           # Shared module entry point
│   │   ├── nix.nix               # Nix settings (flakes, gc)
│   │   ├── networking.nix        # Hostname configuration
│   │   └── users.nix             # User account settings
│   └── home-manager/
│       ├── default.nix           # Home-manager entry point
│       ├── profiles/             # Composable configuration profiles
│       │   ├── minimal.nix       # Essential tools for any machine
│       │   └── development.nix   # Full development environment
│       └── packages/             # Individual package configurations
│           ├── shell/            # Shell (zsh)
│           ├── terminals/        # Terminal emulators
│           ├── development/      # Dev tools (git, nvim, rust)
│           ├── utilities/        # CLI utilities
│           ├── window-management/# Aerospace, jankyborders
│           └── fonts.nix         # Nerd fonts
```

## Profiles

### Minimal
Essential tools for any machine (servers, secondary machines): zsh, starship, bat, fzf, zoxide, git, gpg, karabiner.

### Development
Full development environment (extends minimal): terminals, neovim, ideavim, languages (node, java, python, go, rust), build tools, window management.
