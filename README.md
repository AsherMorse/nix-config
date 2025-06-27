# Asher's Nix Configuration

Configuration for steel (NixOS) and iron (macOS) using Nix flakes.

## Directory Structure

```
nix-config/
├── flake.nix                    # Entry point - defines steel, iron, asher@steel, asher@iron
├── flake.lock                   # Auto-generated dependency versions
├── README.md
│
├── hosts/                       # NixOS/nix-darwin system configs (sudo level)
│   ├── steel/                   # NixOS machine
│   │   └── default.nix          # System packages, services, hardware for steel
│   ├── iron/                    # macOS machine  
│   │   └── default.nix          # System packages, homebrew, macOS settings for iron
│   └── common/                  # Only stuff used by BOTH steel AND iron
│       └── core.nix             # Truly universal system settings (locale, nix config)
│
├── home/                        # Home Manager user configs (user level)
│   ├── asher/
│   │   ├── steel.nix            # Personal config on steel (dotfiles, user programs)
│   │   └── iron.nix             # Personal config on iron (dotfiles, user programs)
│   └── common/
│       └── core.nix             # Only user stuff used on BOTH machines (git, shell)
│
└── modules/                     # Custom reusable modules
    ├── nixos/                   # Custom system-level modules
    └── home-manager/            # Custom user-level modules
```

## Usage

```bash
# On steel (NixOS)
sudo nixos-rebuild switch --flake .#steel

# On iron (macOS) 
darwin-rebuild switch --flake .#iron

# Home Manager (both machines)
home-manager switch --flake .#asher@steel   # On steel
home-manager switch --flake .#asher@iron    # On iron
```

## Principle

Only move things to `common/` if they're literally used on both machines.
