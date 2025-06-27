{ config, pkgs, ... }: {
  imports = [
    ../common/core.nix
  ];

  # macOS-specific user settings
  home.homeDirectory = "/Users/asher";
} 