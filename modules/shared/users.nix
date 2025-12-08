{
  homeDirectory,
  username,
  ...
}:
#############################################################
#
#  Users configuration
#
#############################################################
{
  users.users."${username}" = {
    home = homeDirectory;
    description = username;
  };

  nix.settings.trusted-users = [ username ];
}
