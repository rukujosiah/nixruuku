{ self, inputs, ... }: {
  flake.nixosModules.stylix = { config, lib, pkgs, ... }: {
    stylix.enable = true;
    stylix.image = ./../../mats/wall.png;
    stylix.polarity = "dark";

    stylix.base16Scheme = self.theme;

    stylix.cursor.package = pkgs.bibata-cursors;
    stylix.cursor.name = "Cirno";
    stylix.cursor.size = 24;

    stylix.fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = self.fonts.monospace;
      };
      sansSerif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = self.fonts.sansSerif;
      };
      serif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = self.fonts.sansSerif;
      };
    };

    stylix.fonts.sizes = {
      applications = self.fonts.size;
      terminal = self.fonts.size;
      desktop = self.fonts.size;
      popups = self.fonts.size;
    };
  };
}
