{ inputs, self, ... }: {
  perSystem = { pkgs, ... }: 
  let
    inherit (self) theme;
    # Convert hex to fuzzel color format (RRGGBBAA)
    # Cirno blue: 539CC1
    # Adding CC (80%) opacity for the background
    bg = "${theme.base00}cc";
    fg = "${theme.base05}ff";
    selection = "${theme.base0D}ff";
    selection_fg = "${theme.base00}ff";
    border = "${theme.base0D}ff";

    wrappedFuzzel = (inputs.wrappers.wrapperModules.fuzzel.apply {
      inherit pkgs;
      settings = {
        main = {
          font = "JetBrainsMono Nerd Font:size=17";
          terminal = "alacritty -e";
          prompt = "> ";
          layer = "overlay";
          lines = 15;
          width = 60;
          dpi-aware = "no";
          inner-pad = 10;
          horizontal-pad = 40;
          vertical-pad = 15;
          match-counter = "yes";
        };
        colors = {
          background = bg;
          text = fg;
          match = "${theme.base08}ff";
          selection = selection;
          selection-text = selection_fg;
          selection-match = "${theme.base08}ff";
          border = border;
        };
        border = {
          radius = 10;
          width = 2;
        };
      };
    }).wrapper;
  in {
    packages.fuzzel = wrappedFuzzel;
  };

  flake.nixosModules.fuzzel = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.fuzzel
    ];
  };
}
