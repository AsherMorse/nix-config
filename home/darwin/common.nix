{ config, pkgs, ... }: 

{
  imports = [
    ../common/core.nix
    ../../modules/home/development.nix
  ];

  # Development configuration
  modules.development = {
    enable = true;
    git = {
      userName = "ashermorse";
      userEmail = "ashermorse@icloud.com";
      editor = "nano";
    };
    ssh = {
      enable = true;
      githubKeyPath = "~/.ssh/github";
    };
  };
} 