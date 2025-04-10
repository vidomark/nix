{
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."${username}" = {
    home = "/Users/${username}";
    description = username;
  };

  nix.settings.trusted-users = [username];
}
