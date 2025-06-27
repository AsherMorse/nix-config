{ config, pkgs, ... }: {
  imports = [
    ../common/core.nix
  ];

  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.0;
    orientation = "left";
    tilesize = 36;
    magnification = false;
    mineffect = "scale";
    show-process-indicators = true;
    show-recents = false;
    mru-spaces = false;
  };
}