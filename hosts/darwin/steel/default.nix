{ pkgs, lib, config, ... }: {
  imports = [
    ../common.nix
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
  homebrew = {
    enable = true;
    casks = [
      "pearcleaner"
      "cursor"
    ];
    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "zap";
    };
  };

  # Machine-specific dock apps
  system.defaults.dock = {
    persistent-apps = [
      "/Applications/Pearcleaner.app"
    ];
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