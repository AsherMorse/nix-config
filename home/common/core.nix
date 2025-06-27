{ config, pkgs, ... }: {
  # Universal user settings - works on both macOS and NixOS
  home.username = "asher";
  home.stateVersion = "25.11";

  # Universal packages
  home.packages = with pkgs; [
    nano
  ];

  # Git configuration
  programs.git = {
    enable = true;
    userName = "ashermorse";
    userEmail = "ashermorse@icloud.com";
    
    extraConfig = {
      core.editor = "nano";
    };
  };

  # Shell configuration
  programs.zsh.enable = true;

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
} 