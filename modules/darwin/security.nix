{ config, lib, ... }:

with lib;

{
  options.modules.security = {
    enable = mkEnableOption "security configuration";
    
    touchIdAuth = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf config.modules.security.enable {
    security.pam.services.sudo_local.touchIdAuth = config.modules.security.touchIdAuth;
  };
} 