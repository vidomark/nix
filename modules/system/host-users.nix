{
  pkgs,
  username,
  system,
  ...
} :
#############################################################
#
#  Host & Users configuration
#
#############################################################
let
  home =
    if pkgs.stdenv.hostPlatform.isDarwin then "/Users/${username}"
    else if pkgs.stdenv.hostPlatform.isLinux then "/home/${username}"
    else throw "Unsupported platform for user home directory!";
in {

  networking.hostName = system;
  networking.computerName = system;
  system.defaults.smb.NetBIOSName = system;

  users.users."${username}" = {
    inherit home;
    description = username;
  };

  nix.settings.trusted-users = [username];
}

