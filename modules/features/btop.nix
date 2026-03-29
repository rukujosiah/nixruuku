{ inputs, self, ... }: {
  perSystem = { pkgs, ... }: 
  let
    wrappedBtop = (inputs.wrapper-modules.wrappers.btop.wrap {
      inherit pkgs;
      settings = {
        color_theme = "TTY";
        theme_background = false;
        truecolor = true;
        presets = "cpu:0:default,mem:0:default,net:0:default,proc:0:default";
        graph_symbol = "braille";
        vim_keys = true;
      };
    });
  in {
    packages.btop = wrappedBtop;
  };

  flake.nixosModules.btop = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.btop
    ];
  };
}
