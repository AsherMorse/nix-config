{ pkgs, ... }: {
  imports = [
    ../common.nix
  ];
  
  # User configuration - REQUIRED for Home Manager integration
  users.users.asher = {
    name = "asher";
    home = "/Users/asher";
  };

  # System primary user for Homebrew
  system.primaryUser = "asher";
} 