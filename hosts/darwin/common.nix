{ config, pkgs, ... }: {
  imports = [
    ../common/core.nix
  ];

  # Darwin-specific configuration
  nixpkgs.hostPlatform = "aarch64-darwin";
  security.pam.services.sudo_local.touchIdAuth = true;

  # System defaults
  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.0;
    magnification = false;
    mineffect = "scale";
    mru-spaces = false;
    orientation = "bottom";
    show-process-indicators = true;
    show-recents = true;
    showhidden = true;
    tilesize = 48;
  };

  system.defaults.CustomUserPreferences = {
    "com.apple.dock" = {
      "size-immutable" = true;
    };
  };
}