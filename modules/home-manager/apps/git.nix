{
  pkgs,
  username,
  useremail,
  ...
}:
{
  home.packages = with pkgs; [
    lazygit
  ];

  # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exist!
  #
  #    https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  # home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
  #   rm -f ~/.gitconfig
  # '';

  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = username;
    userEmail = useremail;

    includes = [
      {
        path = "~/work/.gitconfig";
        condition = "gitdir:~/work/";
      }
    ];

    extraConfig = {
      push.autoSetupRemote = true;
      pull.rebase = true;
      core.autocrlf = "input";
      status.submoduleSummary = true;
    };

    delta = {
      enable = true;
      options = {
        navigate = true;
        features = "side-by-side";
      };
    };

    aliases = {
      br = "branch";
      co = "checkout";
      st = "status";
      ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate";
      ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate --numstat";
      cm = "commit -m";
      ca = "commit -am";
      dc = "diff --cached";
      amend = "commit --amend -m";

      update = "submodule update --init --recursive";
      foreach = "submodule foreach";
    };
  };
}
