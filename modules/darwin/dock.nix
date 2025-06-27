{ config, lib, ... }:

with lib;

{
  options.modules.dock = {
    enable = mkEnableOption "dock configuration";
    
    orientation = mkOption {
      type = types.enum [ "left" "bottom" "right" ];
      default = "bottom";
    };
    
    tilesize = mkOption {
      type = types.int;
      default = 64;
    };
    
    autohide = mkOption {
      type = types.bool;
      default = true;
    };
    
    show-recents = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf config.modules.dock.enable {
    system.defaults.dock = {
      inherit (config.modules.dock) autohide orientation tilesize;
      "show-recents" = config.modules.dock.show-recents;
      autohide-delay = 0.0;
      magnification = false;
      mineffect = "scale";
      mru-spaces = false;
      show-process-indicators = true;
      showhidden = true;
    };

    system.defaults.CustomUserPreferences = {
      "com.apple.dock" = {
        "size-immutable" = true;
      };
    };
  };
} 