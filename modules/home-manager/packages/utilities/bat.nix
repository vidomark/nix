{ pkgs, ... }:
{
  home.packages = with pkgs; [ bat-extras.core ];

  programs.bat = {
    enable = true;
    config = {
      theme = "Solarized (dark)";
    };
  };
}
