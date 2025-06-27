{ config, lib, ... }:

with lib;

{
  options.modules.development = {
    enable = mkEnableOption "development configuration";
    
    git = {
      userName = mkOption {
        type = types.str;
        default = "";
      };
      
      userEmail = mkOption {
        type = types.str;
        default = "";
      };
      
      editor = mkOption {
        type = types.str;
        default = "nano";
      };
    };
    
    ssh = {
      enable = mkOption {
        type = types.bool;
        default = true;
      };
      
      githubKeyPath = mkOption {
        type = types.str;
        default = "~/.ssh/github";
      };
    };
  };

  config = mkIf config.modules.development.enable {
    programs.git = {
      enable = true;
      inherit (config.modules.development.git) userName userEmail;
      extraConfig = {
        core.editor = config.modules.development.git.editor;
      };
    };

    programs.ssh = mkIf config.modules.development.ssh.enable {
      enable = true;
      addKeysToAgent = "yes";
      extraConfig = ''
        VisualHostKey yes
      '';
      matchBlocks = {
        "github.com" = {
          hostname = "github.com";
          user = "git";
          identityFile = config.modules.development.ssh.githubKeyPath;
        };
      };
    };
  };
} 