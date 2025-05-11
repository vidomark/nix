{ ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
      directory = {
        truncate_to_repo = false;
      };
    };
  };
}
