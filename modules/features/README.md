# Feature Modules - Wrapped Architecture

This directory contains feature modules for the system, following the **"wrapping all the way down"** philosophy.

## CLI Tools vs. Standalone Apps

To prevent logic duplication and maintain a clean boundary:

### 1. Standalone Apps / GUI / Compositors
*   **Location**: Each gets its own `.nix` file in `modules/features/`.
*   **Content**: Defines its own wrapped package (e.g., `packages.myTerminal`) and its own NixOS system module.
*   **Examples**: `niri.nix`, `noctalia.nix`, `kitty.nix`, `fuzzel.nix`.

### 2. CLI Tools
*   **Location**:
    *   **Simple tools**: Defined directly in `tools.nix` within the `myTools` derivation.
    *   **Complex/Themed tools**: Defined in their own `.nix` file (e.g., `starship.nix`, `btop.nix`) and exported as `packages.<name>`.
*   **Collection**: `tools.nix` acts as the aggregator, collecting these tools into the `myTools` symlinkJoin.
*   **Rule**: `myTools` should be the primary way CLI tools are added to the system `PATH`.

## Benefits

*   **Zero Home Manager Dependency**: No need to manage a separate HM state or generation.
*   **Ghost Config Support**: The entire desktop environment and all tools work perfectly even if `~/.config` is deleted.
*   **Atomic Updates**: Every change to an application's config results in a new derivation, allowing for easy rollbacks and clear dependency tracking.
*   **Portability**: Wrapped applications can be run independently using `nix run`.
