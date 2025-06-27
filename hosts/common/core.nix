{ config, pkgs, ... }: {  
  # Nix configuration
  nix.settings.experimental-features = "nix-command flakes";
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # System packages moved to Home Manager (user-specific)
  environment.systemPackages = [ ];
} 