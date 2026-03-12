{ inputs, self, ... }: {
  perSystem = { pkgs, ... }: 
  let
    settings = {
      display = {
        color = {
          keys = "36";
          output = "37";
        };
      };

      modules = [
        "break"
        {
          type = "custom";
          format = "┌──────────────────────Hardware──────────────────────┐";
        }
        {
          type = "cpu";
          key = "│  ";
        }
        {
          type = "gpu";
          key = "│ 󰍛 ";
        }
        {
          type = "memory";
          key = "│ 󰑭 ";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌──────────────────────Software──────────────────────┐";
        }
        {
          type = "command";
          key = " OS -> ";
          text = ''
            source /etc/os-release
            echo "$PRETTY_NAME"
          '';
        }

        {
          type = "kernel";
          key = "│ ├ ";
        }
        {
          type = "packages";
          key = "│ ├󰏖 ";
        }
        {
          type = "shell";
          key = "└ └ ";
        }
        "break"
        {
          type = "wm";
          key = " WM";
        }
        {
          type = "wmtheme";
          key = "│ ├󰉼 ";
        }
        {
          type = "terminal";
          key = "└ └ ";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
        {
          type = "custom";
          format = "┌────────────────────Uptime / Age────────────────────┐";
        }
        {
          type = "command";
          key = "│ 󰮭 ";
          text = # bash
            ''
              birth_install=$(stat -c %W /)
              current=$(date +%s)
              delta=$((current - birth_install))
              delta_days=$((delta / 86400))
              echo $delta_days days
            '';
        }
        {
          type = "uptime";
          key = "│  ";
        }
        {
          type = "custom";
          format = "└────────────────────────────────────────────────────┘";
        }
        "break"
      ];
    };

    wrappedFastfetch = (inputs.wrappers.wrapperModules.fastfetch.apply {
      inherit pkgs;
      inherit settings;
      # Force the config file to have a .jsonc extension
      "config.jsonc".path = pkgs.writeText "config.jsonc" (builtins.toJSON settings);
    }).wrapper;
  in {
    packages.fastfetch = wrappedFastfetch;
  };

  flake.nixosModules.fastfetch = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.fastfetch
    ];
  };
}
