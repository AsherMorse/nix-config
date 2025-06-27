{ config, pkgs, ... }: {
  imports = [
    ../../darwin/common.nix
  ];

  # Steel-specific packages
  home.packages = with pkgs; [
    code-cursor
  ];
} 