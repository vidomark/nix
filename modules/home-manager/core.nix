{ pkgs, ... }:
{
  home.packages =
    with pkgs;
    [
      # Terminal Emulators
      alacritty
      kitty

      # Archives and Compression
      zip # Utility for packaging and compressing files
      unzip # Extractor for .zip files

      # Programming Languages and Tools
      nodejs_20 # JavaScript runtime built on Chrome's V8 engine
      jdk21 # Java Development Kit for Java 21
      python3 # Python programming language interpreter
      go # Go programming language
      maven # Build automation tool for Java projects
      gradle # Build automation tool for multi-language projects
      sqlcmd # CLI tool for SQL Server
      quarkus # CLI tool for Quarkus framework
      gcc # GNU Compiler Collection
      lua # Lua programming language
      nixfmt-rfc-style # Nix formatter

      # Utilities
      ripgrep # Fast search tool for recursively searching directories
      ripgrep-all # Fast search tool for recursively searching directories
      jq # Command-line JSON processor
      yq-go # Command-line YAML processor
      zsh-vi-mode # Command-line vim bindings
      nmap # Network discovery and security auditing tool
      fd # Simple, fast, and user-friendly alternative to `find`
      htop # Interactive process viewer
      lsd # Modern replacement for `ls` with color support
      openssl # Toolkit for SSL/TLS and cryptography
      tldr # Simplified and community-driven man pages
      zoxide # Smarter `cd` command for navigating directories
      tree-sitter # Incremental parsing system for syntax highlighting
      diff-so-fancy # Enhances `git diff` output with color and formatting
      direnv # Environment switcher for shell sessions
      curl
      wget
      clipboard-jh

      # System Tools
      file # Determines file type
      which # Locates a command
      gnupg # GNU Privacy Guard for encryption and signing
      stow # Symlink farm manager for managing dotfiles
      lesspipe # Less preprocessor

      # Miscellaneous
      tree # Displays directory structure in a tree format
      checkstyle # Code style checker for Java
      rich-cli # Command line interface to rich
      glow # Markdown previewer in the terminal
    ]
    ++ (lib.optionals stdenv.isDarwin [
      mas # Utility to install official applications
      rectangle # Window manager
    ]);

  apps.karabiner = {
    enable = pkgs.stdenv.hostPlatform.isDarwin;
  };

  home.sessionVariables = {
    LESSOPEN = "|lesspipe.sh %s";
  };
}
