{ config, pkgs, ... }: {
  # Basic system configuration
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = [ ];
} 