{ self, ... }: {
  perSystem = { pkgs, self', ... }: {
    packages.myTerminal = let
      inherit (self) theme fonts;
      config = pkgs.writeText "kitty.conf" ''
        font_family ${fonts.monospace}
        font_size ${toString fonts.size}
        background_opacity 0.9
        confirm_os_window_close 0
        background #${theme.base00}
        foreground #${theme.base05}
        cursor #${theme.base05}
        color0 #${theme.base00}
        color1 #${theme.base08}
        color2 #${theme.base0B}
        color3 #${theme.base0A}
        color4 #${theme.base0D}
        color5 #${theme.base0E}
        color6 #${theme.base0C}
        color7 #${theme.base05}
        color8 #${theme.base03}
        color9 #${theme.base08}
        color10 #${theme.base0B}
        color11 #${theme.base0A}
        color12 #${theme.base0D}
        color13 #${theme.base0E}
        color14 #${theme.base0C}
        color15 #${theme.base07}
        # Set default command to myShell
        shell ${self'.packages.myShell}/bin/fish
      '';
    in pkgs.runCommand "myTerminal" {
      nativeBuildInputs = [ pkgs.makeWrapper ];
    } ''
      mkdir -p $out/bin
      makeWrapper ${pkgs.kitty}/bin/kitty $out/bin/kitty \
        --add-flags "--config ${config}"
    '';
  };

  flake.nixosModules.kitty = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.myTerminal
    ];
  };
}
