# Asher's Nix Configuration

Configuration for steel (macOS) and iron (NixOS) using Nix flakes.

## Directory Structure

```
nix-config/
├── flake.nix                    # Entry point - defines steel, iron, asher@steel, asher@iron
├── flake.lock                   # Auto-generated dependency versions
├── README.md
│
├── hosts/                       # NixOS/nix-darwin system configs (sudo level)
│   ├── common/                  # Truly universal settings (both macOS and NixOS)
│   │   └── core.nix             # Universal system settings (locale, nix config)
│   ├── darwin/                  # macOS-specific settings
│   │   ├── common.nix           # Shared macOS settings (homebrew, macOS defaults)
│   │   └── steel/               # macOS machine
│   │       └── default.nix      # Steel-specific macOS config
│   └── nixos/                   # NixOS-specific settings
│       ├── common.nix           # Shared NixOS settings (systemd, hardware)
│       └── iron/                # NixOS machine
│           └── default.nix      # Iron-specific NixOS config
│
├── home/                        # Home Manager user configs (user level)
│   ├── common/
│   │   └── core.nix             # Universal user settings (git, shell)
│   ├── darwin/
│   │   ├── common.nix           # Shared macOS user settings
│   │   └── asher/
│   │       └── steel.nix        # Personal config on steel (macOS dotfiles, programs)
│   └── nixos/
│       ├── common.nix           # Shared NixOS user settings
│       └── asher/
│           └── iron.nix         # Personal config on iron (NixOS dotfiles, programs)
│
└── modules/                     # Custom reusable modules
    ├── nixos/                   # Custom system-level modules
    └── home-manager/            # Custom user-level modules
```

## Usage

```bash
# On steel (macOS)
darwin-rebuild switch --flake .#steel

# On iron (NixOS) 
sudo nixos-rebuild switch --flake .#iron

# Home Manager (both machines)
home-manager switch --flake .#asher@steel   # On steel (macOS)
home-manager switch --flake .#asher@iron    # On iron (NixOS)
```

## Principle

- Only move things to `common/` if they're literally used on both macOS AND NixOS
- Use `darwin/common.nix` for settings shared across all macOS machines
- Use `nixos/common.nix` for settings shared across all NixOS machines
