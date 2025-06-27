{ config, pkgs, ... }: {

  
  imports = [
    ../common.nix
  ];

  # Machine-specific user configuration
  home.username = "asher";
  home.stateVersion = "25.11";

  # Machine-specific packages
  home.packages = with pkgs; [
    neofetch
  ];
}