{ config, lib, ... }: 

with lib;
let
  cfg = config.modules.homebrew;
in
{
  options.modules.homebrew = {
    enable = mkEnableOption "homebrew configuration";
    
    casks = mkOption {
      type = types.listOf types.str;
      default = [];
    };
    
    casksWithNoQuarantine = mkOption {
      type = types.listOf types.str;
      default = [];
      description = "Casks to install with the --no-quarantine flag.";
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

  config = mkIf cfg.enable {
    homebrew = {
      enable = true;
      brews = cfg.brews;
      casks = cfg.casks ++ (map (name: {
        inherit name;
        args = { no_quarantine = true; };
      }) cfg.casksWithNoQuarantine);
      onActivation = {
        autoUpdate = false;
        upgrade = false;
        cleanup = config.modules.homebrew.cleanup;
      };
    };
  };
} 