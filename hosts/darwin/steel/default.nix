{ pkgs, lib, config, ... }: {
  # Nix configuration
  nix.settings.experimental-features = "nix-command flakes";
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # System packages moved to Home Manager (user-specific)
  environment.systemPackages = [ ];

  # Darwin-specific settings
  nixpkgs.hostPlatform = "aarch64-darwin";
  
  # Used for backwards compatibility
  system.stateVersion = 6;

  # Copy applications to /Applications/Nix Apps instead of symlinking
  # This makes them show up in Spotlight and Launchpad
  system.activationScripts.applications.text = lib.mkForce ''
    echo "Setting up /Applications/Nix Apps..." >&2
    appsSrc="${config.system.build.applications}/Applications/"
    baseDir="/Applications/Nix Apps"
    mkdir -p "$baseDir"
    ${pkgs.rsync}/bin/rsync --archive --checksum --chmod=-w --copy-unsafe-links --delete "$appsSrc" "$baseDir"
  '';

  # Homebrew configuration
  homebrew = {
    enable = true;
    
    # Homebrew casks
    casks = [
      "pearcleaner"
    ];

    # Homebrew configuration options
    onActivation = {
      autoUpdate = false;       # Don't auto-update during darwin-rebuild
      upgrade = false;          # Don't auto-upgrade during darwin-rebuild
      cleanup = "zap";          # Remove unlisted formulae/casks aggressively
    };
  };
  
  # User configuration
  users.users.asher = {
    name = "asher";
    home = "/Users/asher";
  };

  # System primary user for Homebrew
  # system.primaryUser = "asher";
} 