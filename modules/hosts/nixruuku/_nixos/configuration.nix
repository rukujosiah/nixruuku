{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      inputs.stylix.nixosModules.stylix
      inputs.self.nixosModules.core
      inputs.self.nixosModules.users
      inputs.self.nixosModules.services
      inputs.self.nixosModules.stylix
      inputs.self.nixosModules.gaming
      inputs.self.nixosModules.japanese
      # The programs below are now imported via flake-parts in flake.nix
      inputs.self.nixosModules.niri
      inputs.self.nixosModules.starship
      inputs.self.nixosModules.kitty
      inputs.self.nixosModules.fastfetch-dynamic
      inputs.self.nixosModules.btop
      inputs.self.nixosModules.fuzzel
      inputs.self.nixosModules.tools
    ];
}
