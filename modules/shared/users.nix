{
  homeDirectory,
  username,
  ...
}:
{
  users.users."${username}" = {
    home = homeDirectory;
    description = username;
  };

  nix.settings.trusted-users = [ username ];
}
