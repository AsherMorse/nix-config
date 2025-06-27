{ pkgs, ... }: {
  imports = [
    ../common.nix
  ];
  
  # Steel-specific configuration
  environment.systemPackages = [
    pkgs.code-cursor
  ];
} 