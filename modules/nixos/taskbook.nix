{ inputs, self, ... }: {
  # Taskbook package is now pulled from standard nixpkgs
  # This module follows the dendritic pattern by providing a NixOS module branch.

  flake.nixosModules.taskbook = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.taskbook
    ];
  };
}
