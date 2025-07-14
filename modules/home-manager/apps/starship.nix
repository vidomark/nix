{ pkgs, ... }:
let
  noRuntimeVersionsToml =
    pkgs.runCommand "no-runtime-versions" { nativeBuildInputs = [ pkgs.starship ]; }
      ''
        ${pkgs.starship}/bin/starship preset no-runtime-versions -o $out
      '';
  noRuntimeVersionsPreset = builtins.fromTOML (builtins.readFile noRuntimeVersionsToml);

  nerdfontToml = pkgs.runCommand "nerd-font-symbols" { nativeBuildInputs = [ pkgs.starship ]; } ''
    ${pkgs.starship}/bin/starship preset nerd-font-symbols -o $out
  '';
  nerdfontPreset = builtins.fromTOML (builtins.readFile nerdfontToml);
in
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings =
      nerdfontPreset
      // noRuntimeVersionsPreset
      // {
        add_newline = false;
        directory = {
          truncate_to_repo = false;
        };
      };
  };
}
