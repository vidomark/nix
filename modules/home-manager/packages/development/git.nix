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

  programs.git = {
    enable = true;
    lfs.enable = true;

    settings = {
      user = {
        name = username;
        email = useremail;
      };

      push.autoSetupRemote = true;
      pull.rebase = true;
      core.autocrlf = "input";
      status.submoduleSummary = true;

      alias = {
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

    includes = [
      {
        path = "~/work/.gitconfig";
        condition = "gitdir:~/work/";
      }
    ];
  };
}
