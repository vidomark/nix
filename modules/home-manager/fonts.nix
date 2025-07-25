{ pkgs, ... }:
{
  home.packages = [
    pkgs.nerd-fonts.comic-shanns-mono
  ];

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts.monospace = [
        "ComicShannsMono Nerd Font Mono"
      ];
    };
  };
}
