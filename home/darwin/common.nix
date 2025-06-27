{ config, pkgs, ... }: {
  imports = [
    ../common/core.nix
  ];

  # Development configuration
  programs.git = {
    enable = true;
    userName = "ashermorse";
    userEmail = "ashermorse@icloud.com";
    extraConfig = {
      core.editor = "nano";
    };
  };

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    extraConfig = ''
      VisualHostKey yes
    '';
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/github";
      };
    };
  };
} 