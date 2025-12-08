{ }:
{
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      features = "side-by-side";
    };
  };
}
