{ config, pkgs, ... }: {
  imports = [
    ../common/core.nix
    ../../modules/darwin/dock.nix
    ../../modules/darwin/security.nix
  ];

  # Darwin-specific configuration
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Enable modules
  modules.dock = {
    enable = true;
    orientation = "bottom";
    tilesize = 48;
    show-recents = true;
  };

  modules.security = {
    enable = true;
    touchIdAuth = true;
  };
}