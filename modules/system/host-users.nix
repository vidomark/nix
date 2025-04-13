{
  homeDirectory,
  username,
  system,
  ...
} :
#############################################################
#
#  Host & Users configuration
#
#############################################################
{

  networking.hostName = system;
  networking.computerName = system;
  system.defaults.smb.NetBIOSName = system;

  users.users."${username}" = {
    home = homeDirectory;
    description = username;
  };

  nix.settings.trusted-users = [username];
}

