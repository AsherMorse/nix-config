{ config, pkgs, ... }: 

{
  imports = [
    ../common/core.nix
    ../../modules/darwin/dock.nix
    ../../modules/darwin/security.nix
  ];

  # Darwin-specific configuration
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Enable modules
  modules.dock.enable = true;
  modules.security.enable = true;
}