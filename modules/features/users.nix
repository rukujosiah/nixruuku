{ self, ... }: {
  flake.nixosModules.users = { config, lib, pkgs, ... }: {
    users.users.ruuku = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      packages = with pkgs; [
        tree
      ];
    };
    programs.firefox.enable = true;
  };
}
