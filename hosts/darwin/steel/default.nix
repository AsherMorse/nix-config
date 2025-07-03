{ pkgs, lib, config, ... }: 

{
  imports = [
    ../common.nix
    ../../../modules/darwin/homebrew.nix
  ];

  # Machine-specific configuration
  system.stateVersion = 6;
  system.primaryUser = "asher";

  # User configuration
  users.users.asher = {
    name = "asher";
    home = "/Users/asher";
  };

  # Package management
  modules.homebrew = {
    enable = true;
    casks = [
      "aldente"
      "cursor"
      "pearcleaner"
      "steam"
    ];
    casksWithNoQuarantine = [
      "librewolf"
    ];
    cleanup = "zap";
  };

  # Machine-specific dock apps
  system.defaults.dock = {
    persistent-apps = [
      "/Applications/Pearcleaner.app"
    ];
    wvous-tl-corner = 1;
    wvous-tr-corner = 1;
    wvous-bl-corner = 1;
    wvous-br-corner = 1;
  };

  # Application handling
  system.activationScripts.applications.text = lib.mkForce ''
    echo "Setting up /Applications/Nix Apps..." >&2
    appsSrc="${config.system.build.applications}/Applications/"
    baseDir="/Applications/Nix Apps"
    mkdir -p "$baseDir"
    ${pkgs.rsync}/bin/rsync --archive --checksum --chmod=-w --copy-unsafe-links --delete "$appsSrc" "$baseDir"
  '';
} 
