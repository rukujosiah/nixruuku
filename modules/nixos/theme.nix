{ pkgs, inputs, ... }:

{
  stylix.enable = true;
  stylix.image = ../../mats/wall.png;
  stylix.polarity = "dark";

  # Use centralized theme from flake
  stylix.base16Scheme = inputs.self.theme;

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Cirno";
  stylix.cursor.size = 24;

  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = inputs.self.fonts.monospace;
    };
    sansSerif = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = inputs.self.fonts.sansSerif;
    };
    serif = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = inputs.self.fonts.sansSerif;
    };
  };

  stylix.fonts.sizes = {
    applications = inputs.self.fonts.size;
    terminal = inputs.self.fonts.size;
    desktop = inputs.self.fonts.size;
    popups = inputs.self.fonts.size;
  };
}
