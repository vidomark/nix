{
  hostname,
  ...
}:
#############################################################
#
#  Networking configuration
#
#############################################################
{
  networking.hostName = hostname;
  networking.computerName = hostname;
  system.defaults.smb.NetBIOSName = hostname;
}
