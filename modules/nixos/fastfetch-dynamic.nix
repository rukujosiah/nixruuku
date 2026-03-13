{ inputs, self, ... }: {
  perSystem = { pkgs, ... }: 
  let
    inherit (self) theme;
    
    # logo reference path
    logoImg = ./../../mats/cirnos-logo.png;

    # Dynamic configuration using centralized Nutrients
    ffConfig = pkgs.writeText "config.jsonc" (builtins.toJSON {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        "type" = "file";
        "source" = ""; # Overridden by command line
        # "padding" = { "right" = 4; };
      };
      "display" = { "separator" = " : "; };
      modules = [
        { type = "command"; key = "  "; keyColor = "yellow"; text = "echo 'I am ...'"; }
        { type = "custom"; format = "┌────────────────────────────────────────────────┐"; }
        { type = "os"; key = "  󰣇 OS"; format = "{2}"; keyColor = "red"; }
        { type = "kernel"; key = "   Kernel"; format = "{2}"; keyColor = "red"; }
        { type = "packages"; key = "  󰏗 Packages"; keyColor = "green"; }
        { type = "display"; key = "  󰍹 Display"; format = "{1}x{2} @ {3}Hz [{7}]"; keyColor = "green"; }
        { type = "terminal"; key = "   Terminal"; keyColor = "yellow"; }
        { type = "wm"; key = "  󱗃 WM"; format = "{2}"; keyColor = "yellow"; }
        { type = "custom"; format = "└────────────────────────────────────────────────┘"; }
        "break"
        { type = "title"; key = "  "; keyColor = "yellow"; format = "{6} {7} {8}"; }
        { type = "custom"; format = "┌────────────────────────────────────────────────┐"; }
        { type = "cpu"; format = "{1}"; key = "   CPU"; keyColor = "blue"; }
        { type = "gpu"; format = "{1} {2}"; key = "  󰊴 GPU"; keyColor = "blue"; }
        { type = "memory"; key = "  󰍛 Memory "; keyColor = "red"; }
        { type = "command"; key = "  󱦟 OS Age "; keyColor = "red"; text = "birth_install=$(stat -c %W /); current=$(date +%s); echo $(( (current - birth_install) / 86400 )) days"; }
        { type = "uptime"; key = "  󱫐 Uptime "; keyColor = "red"; }
        { type = "custom"; format = "└────────────────────────────────────────────────┘"; }
        { type = "colors"; paddingLeft = 2; symbol = "circle"; }
      ];
    });

    ffScript = pkgs.writeShellScriptBin "ff" ''
      # Create a safe temporary file and ensure cleanup
      TEMP_ASCII=$(mktemp --suffix=.txt)
      trap 'rm -f "$TEMP_ASCII"' EXIT

      # Generate fresh ASCII and save to temp file
      ${pkgs.chafa}/bin/chafa --symbols braille --format symbols -c full --size 50x25 --dither none --fg-only "${logoImg}" > "$TEMP_ASCII"

      # Execute fastfetch using the temp file as logo
      ${pkgs.fastfetch}/bin/fastfetch --logo "$TEMP_ASCII" --config "${ffConfig}"
    '';
  in {
    packages.fastfetch-dynamic = ffScript;
  };

  flake.nixosModules.fastfetch-dynamic = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.fastfetch-dynamic
      pkgs.fastfetch
      pkgs.chafa
      pkgs.imagemagick
    ];
  };
}
