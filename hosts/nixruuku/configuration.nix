{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      inputs.stylix.nixosModules.stylix
      ../../modules/nixos/core.nix
      ../../modules/nixos/users.nix
      ../../modules/nixos/services.nix
      # The programs below are now imported via flake-parts in flake.nix
      inputs.self.nixosModules.niri
      inputs.self.nixosModules.alacritty
      inputs.self.nixosModules.starship
      inputs.self.nixosModules.kitty
      inputs.self.nixosModules.fastfetch-dynamic
      inputs.self.nixosModules.btop
      inputs.self.nixosModules.fuzzel
      inputs.self.nixosModules.taskbook
      ../../modules/nixos/theme.nix
      ../../modules/nixos/gaming.nix
      ../../modules/nixos/japanese.nix
    ];
}
