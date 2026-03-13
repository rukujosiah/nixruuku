# NixOS Dendritic Configuration Files

A highly modular, portable, and build-time validated NixOS configuration using the **Dendritic Pattern** and **Nix Wrappers**.

## Architecture
This configuration follows the "Dendritic" (branch-like) structure inspired by **Vimjoyer**. It uses `flake-parts` to modularize every aspect of the system.

- **Centralized Nutrients:** Global variables like the **Cirno Color Palette** and system fonts are defined in `modules/theme.nix` and shared across all modules.
- **Self-Contained Branches:** Programs are defined as independent modules that contain both their **Package** (wrapped binary) and their **NixOS Service** configuration.

## Key stuff
- **[Niri](https://github.com/YaLTeR/niri):** A scrollable tiling Wayland compositor.
- **[Stylix](https://github.com/danth/stylix):** For system-wide theming (Colors, Fonts, Wallpaper).
- **[Wrappers](https://github.com/Lassulus/wrappers):** Eliminates "dotfile litter" by baking configurations directly into the program binaries.
- **[NH (Nix Helper)](https://github.com/viperML/nh):** Provides a "comfy" CLI for system switching and maintenance.

## Modules
- **Terminals:** Alacritty (Primary), Kitty (Secondary/Yazi).
- **Shell:** Bash with Starship prompt.
- **Workflow:** `wlr-which-key` (`Mod+D`) for keyboard-driven application launching.
- **Gaming:** Steam & Lutris (pre-configured with full Japanese VN support).
- **Utilities:** Yazi (File Manager), Btop (Monitor), Fuzzel (Launcher), Fastfetch.

## Usage

### Switching/Updating
This repo uses `nh` for management. To apply changes:
```bash
nh os switch .
```

### Portability
Because of the **Wrapper** architecture, this repository is fully portable. You can clone it to any NixOS machine and run the switch command; the system will build exactly as defined, without needing manual symlinks in `~/.config`.

## Directory Structure
- `hosts/`: Host-specific configurations (e.g., `nixruuku`).
- `modules/`:
    - `nixos/`: Dendritic program modules (Package + Service).
    - `home/`: Minimal Home-Manager modules for user-specific environment.
    - `theme.nix`: The centralized nutrient file (colors/fonts).
- `config/`: Local reference files and assets (Wallpapers, Logos).
