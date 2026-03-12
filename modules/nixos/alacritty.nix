{ inputs, self, ... }: {
  perSystem = { pkgs, ... }: 
  let
    inherit (self) theme;
    wrappedAlacritty = (inputs.wrappers.wrapperModules.alacritty.apply {
      inherit pkgs;
      settings = {
        window = {
          opacity = 0.9;
          padding = { x = 12; y = 12; };
          dynamic_padding = true;
        };
        font = {
          normal = { family = self.fonts.monospace; style = "Regular"; };
          size = self.fonts.size;
        };
        colors = {
          primary = { background = "#${theme.base00}"; foreground = "#${theme.base05}"; };
          cursor = { text = "#${theme.base00}"; cursor = "#${theme.base05}"; };
          normal = {
            black = "#${theme.base00}"; red = "#${theme.base08}"; green = "#${theme.base0B}"; yellow = "#${theme.base0A}";
            blue = "#${theme.base0D}"; magenta = "#${theme.base0E}"; cyan = "#${theme.base0C}"; white = "#${theme.base05}";
          };
          bright = {
            black = "#${theme.base03}"; red = "#${theme.base08}"; green = "#${theme.base0B}"; yellow = "#${theme.base0A}";
            blue = "#${theme.base0D}"; magenta = "#${theme.base0E}"; cyan = "#${theme.base0C}"; white = "#${theme.base07}";
          };
        };
      };
    }).wrapper;
  in {
    packages.alacritty = wrappedAlacritty;
  };

  flake.nixosModules.alacritty = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.alacritty
    ];
  };
}
