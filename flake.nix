{
  description = "Asher's Nix Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#steel
    darwinConfigurations.steel = nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/darwin/steel
        
        # Add Home Manager module
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.asher = import ./home/darwin/asher/steel.nix;
        }
        
        # Add system configuration revision for darwin-version
        ({ pkgs, ... }: {
          system.configurationRevision = self.rev or self.dirtyRev or null;
        })
      ];
    };
  };
}
