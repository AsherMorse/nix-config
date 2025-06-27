{ config, pkgs, ... }: {
  # Core user configuration
  home.packages = with pkgs; [
    nano
  ];

  programs.home-manager.enable = true;
  programs.zsh.enable = true;
} 