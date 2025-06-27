{ config, pkgs, ... }:

{
  imports = [
    ../common/core.nix
  ];

  # No need to set home.homeDirectory - it's derived from users.users.<name>.home in nix-darwin
} 