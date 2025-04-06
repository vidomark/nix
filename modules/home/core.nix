{pkgs, ...}:

{
  home.packages = with pkgs; [
    # Archives and Compression
    zip               # Utility for packaging and compressing files
    xz                # High-ratio data compression program
    unzip             # Extractor for .zip files
    p7zip             # Command-line version of 7-Zip, a file archiver

    # Programming Languages and Tools
    nodejs_20         # JavaScript runtime built on Chrome's V8 engine
    jdk21             # Java Development Kit for Java 21
    python3           # Python programming language interpreter
    go                # Go programming language
    maven             # Build automation tool for Java projects
    gradle            # Build automation tool for multi-language projects
    sqlcmd            # CLI tool for SQL Server
    quarkus           # CLI tool for Quarkus framework

    # Utilities
    ripgrep           # Fast search tool for recursively searching directories
    ripgrep-all       # Fast search tool for recursively searching directories
    jq                # Command-line JSON processor
    yq-go             # Command-line YAML processor
    zsh-vi-mode       # Command-line vim bindings
    aria2             # Multi-protocol & multi-source download utility
    socat             # Multipurpose relay for bidirectional data transfer
    nmap              # Network discovery and security auditing tool
    fd                # Simple, fast, and user-friendly alternative to `find`
    htop              # Interactive process viewer
    lsd               # Modern replacement for `ls` with color support
    openssl           # Toolkit for SSL/TLS and cryptography
    tldr              # Simplified and community-driven man pages
    zoxide            # Smarter `cd` command for navigating directories
    tree-sitter       # Incremental parsing system for syntax highlighting
    diff-so-fancy     # Enhances `git diff` output with color and formatting
    direnv            # Environment switcher for shell sessions
    curl
    wget
    clipboard-jh
    jmeter

    # System Tools
    file              # Determines file type
    which             # Locates a command
    gnused            # GNU version of the stream editor `sed`
    gnutar            # GNU version of the tar archiving utility
    gawk              # GNU version of the text processing language `awk`
    zstd              # Fast compression algorithm
    caddy             # Web server with automatic HTTPS
    gnupg             # GNU Privacy Guard for encryption and signing
    just              # Task runner for command execution
    skhd              # Hotkey daemon for macOS
    stow              # Symlink farm manager for managing dotfiles

    # Miscellaneous
    tree              # Displays directory structure in a tree format
    checkstyle        # Code style checker for Java
    glow              # Markdown previewer in the terminal

    # Fonts
    nerdfonts
  ];
}
