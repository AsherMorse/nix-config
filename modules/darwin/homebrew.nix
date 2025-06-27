{ config, lib, ... }: 

with lib;

{
  options.modules.homebrew = {
    enable = mkEnableOption "homebrew configuration";
    
    casks = mkOption {
      type = types.listOf types.str;
      default = [];
    };
    
    brews = mkOption {
      type = types.listOf types.str;
      default = [];
    };
    
    cleanup = mkOption {
      type = types.enum [ "none" "uninstall" "zap" ];
      default = "zap";
    };
  };

  config = mkIf config.modules.homebrew.enable {
    homebrew = {
      enable = true;
      inherit (config.modules.homebrew) casks brews;
      onActivation = {
        autoUpdate = false;
        upgrade = false;
        cleanup = config.modules.homebrew.cleanup;
      };
    };
  };
} 