{ config, pkgs, ... }:

{
  programs.gpg = {
    enable = true;
    settings = {
      default-cache-ttl = "31536000";   # 1 year
      max-cache-ttl = "31536000";       # 1 year
    };
  };
}
