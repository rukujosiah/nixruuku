{ inputs, self, lib, ... }: {
  # Define the which-key wrapper module at the flake level
  flake.wrapperModules.which-key = inputs.wrappers.lib.wrapModule (
    { config, lib, ... }: 
    let
      yamlFormat = config.pkgs.formats.yaml {};
    in {
      options.settings = lib.mkOption { type = yamlFormat.type; };
      config = {
        package = config.pkgs.wlr-which-key;
        args = [ (toString (yamlFormat.generate "config.yaml" config.settings)) ];
      };
    }
  );

  # Define a helper to create which-key executables with a specific menu
  flake.mkWhichKeyExe = pkgs: menu: 
    let
      inherit (self) theme;
      wrapped = (self.wrapperModules.which-key.apply {
        inherit pkgs;
        settings = {
          inherit menu;
          font = "${self.fonts.monospace} ${toString self.fonts.size}";
          background = "#${theme.base00}";
          color = "#${theme.base05}";
          border = "#${theme.base0D}";
          separator = " ➜ ";
          border_width = 2;
          corner_r = 10;
          padding = 15;
          rows_per_column = 10;
          column_padding = 25;
          anchor = "center";
        };
      }).wrapper;
    in "${wrapped}/bin/wlr-which-key";
}
