{ inputs, self, ... }: {
  perSystem = { pkgs, self', ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        prefer-no-csd = null;
        input = {
          keyboard = {
            repeat-delay = 200;
            repeat-rate = 35;
            numlock = null;
          };
          touchpad.tap = null;
          focus-follows-mouse._attrs.max-scroll-amount = "0%";
        };
        layout = {
          gaps = 5;
          center-focused-column = "never";
          preset-column-widths = [
            { proportion = 0.33333; }
            { proportion = 0.5; }
            { proportion = 0.66667; }
          ];
          default-column-width = { proportion = 0.5; };
          background-color = "transparent";
          focus-ring = {
            width = 1.5;
            active-color = "#${self.theme.base0D}";
            inactive-color = "#${self.theme.base02}";
          };
          border = {
            off = null;
            width = 1.5;
            active-color = "#${self.theme.base0B}";
            inactive-color = "#${self.theme.base02}";
            urgent-color = "#${self.theme.base08}";
          };
          shadow = {
            softness = 30;
            spread = 5;
            offset._attrs = { x = 0; y = 5; };
            color = "#0007";
          };
        };
        spawn-at-startup = [
          "${self'.packages.myNoctalia}/bin/noctalia-shell"
          ["fcitx5" "-d"]
          ["swaybg" "-m" "fill" "-i" "${../../mats/wall.png}"]
        ];
        layer-rules = [
          {
            matches = [{ namespace = "^wallpaper$"; }];
            place-within-backdrop = true;
          }
          {
            matches = [{ namespace = "^launcher$"; }];
          }
        ];
        screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
        window-rules = [
          { matches = [{ app-id = "^org\\\\.wezfurlong\\\\.wezterm$"; }]; default-column-width = { }; }
          { matches = [{ app-id = "firefox$"; title = "^Picture-in-Picture$"; }]; open-floating = true; }
          { matches = [{ title = "Firefox"; }]; open-on-workspace = "c"; open-maximized = true; }
          { geometry-corner-radius = 4; clip-to-geometry = true; }
        ];
        workspaces = { "c" = { }; "b" = { }; "a" = { }; };
        binds = let
          navigation = {
            "Mod+Q".close-window = null;
            "Mod+O".toggle-overview = null;
            "Mod+H".focus-column-left = null;
            "Mod+J".focus-window-down = null;
            "Mod+K".focus-window-up = null;
            "Mod+L".focus-column-right = null;
            "Mod+Left".focus-column-left = null;
            "Mod+Down".focus-window-down = null;
            "Mod+Up".focus-window-up = null;
            "Mod+Right".focus-column-right = null;
            "Mod+Ctrl+H".move-column-left = null;
            "Mod+Ctrl+J".move-window-down = null;
            "Mod+Ctrl+K".move-window-up = null;
            "Mod+Ctrl+L".move-column-right = null;
            "Mod+Home".focus-column-first = null;
            "Mod+End".focus-column-last = null;
            "Mod+Ctrl+Home".move-column-to-first = null;
            "Mod+Ctrl+End".move-column-to-last = null;
            "Mod+Page_Down".focus-workspace-down = null;
            "Mod+Page_Up".focus-workspace-up = null;
            "Mod+U".focus-workspace-down = null;
            "Mod+I".focus-workspace-up = null;
            "Mod+1".focus-workspace = 1;
            "Mod+2".focus-workspace = 2;
            "Mod+3".focus-workspace = 3;
            "Mod+4".focus-workspace = 4;
            "Mod+5".focus-workspace = 5;
            "Mod+6".focus-workspace = 6;
            "Mod+7".focus-workspace = 7;
            "Mod+8".focus-workspace = 8;
            "Mod+9".focus-workspace = 9;
            "Mod+Shift+1".move-column-to-workspace = 1;
            "Mod+Shift+2".move-column-to-workspace = 2;
            "Mod+Shift+3".move-column-to-workspace = 3;
            "Mod+Shift+4".move-column-to-workspace = 4;
            "Mod+Shift+5".move-column-to-workspace = 5;
            "Mod+Shift+6".move-column-to-workspace = 6;
            "Mod+Shift+7".move-column-to-workspace = 7;
            "Mod+Shift+8".move-column-to-workspace = 8;
            "Mod+Shift+9".move-column-to-workspace = 9;
            "Mod+Shift+Left".focus-monitor-left = null;
            "Mod+Shift+Down".focus-monitor-down = null;
            "Mod+Shift+Up".focus-monitor-up = null;
            "Mod+Shift+Right".focus-monitor-right = null;
            "Mod+Shift+H".focus-monitor-left = null;
            "Mod+Shift+J".focus-monitor-down = null;
            "Mod+Shift+K".focus-monitor-up = null;
            "Mod+Shift+L".focus-monitor-right = null;
            "Mod+Shift+Ctrl+Left".move-column-to-monitor-left = null;
            "Mod+Shift+Ctrl+Down".move-column-to-monitor-down = null;
            "Mod+Shift+Ctrl+Up".move-column-to-monitor-up = null;
            "Mod+Shift+Ctrl+Right".move-column-to-monitor-right = null;
            "Mod+Shift+Ctrl+H".move-column-to-monitor-left = null;
            "Mod+Shift+Ctrl+J".move-column-to-monitor-down = null;
            "Mod+Shift+Ctrl+K".move-column-to-monitor-up = null;
            "Mod+Shift+Ctrl+L".move-column-to-monitor-right = null;
            "Mod+BracketLeft".consume-or-expel-window-left = null;
            "Mod+BracketRight".consume-or-expel-window-right = null;
            "Mod+Comma".consume-window-into-column = null;
            "Mod+Period".expel-window-from-column = null;
            "Mod+R".switch-preset-column-width = null;
            "Mod+F".maximize-column = null;
            "Mod+Shift+F".fullscreen-window = null;
            "Mod+C".center-column = null;
            "Mod+Minus".set-column-width = "-10%";
            "Mod+Equal".set-column-width = "+10%";
            "Mod+V".toggle-window-floating = null;
            "Mod+W".toggle-column-tabbed-display = null;
          };
          system = {
            "Mod+Shift+Slash".show-hotkey-overlay = null;
            "Mod+S".screenshot = null;
            "Mod+Shift+E".quit = null;
            "Super+Alt+L" = { spawn = "swaylock"; _attrs = { hotkey-overlay-title = "Lock the Screen: swaylock"; }; };
            "XF86AudioRaiseVolume" = { spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+"; _attrs = { allow-when-locked = true; }; };
            "XF86AudioLowerVolume" = { spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"; _attrs = { allow-when-locked = true; }; };
            "XF86AudioMute" = { spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; _attrs = { allow-when-locked = true; }; };
          };
          apps = {
            "Mod+Return" = { spawn = "${self'.packages.myTerminal}/bin/kitty"; _attrs = { hotkey-overlay-title = "Open a Terminal: kitty"; }; };
            "Mod+D" = {
              spawn-sh = self.mkWhichKeyExe pkgs [
                { key = "f"; desc = "Firefox"; cmd = "firefox"; }
                { key = "b"; desc = "Btop"; cmd = "${self'.packages.myTerminal}/bin/kitty -e btop"; }
              ];
              _attrs = { hotkey-overlay-title = "Launch Menu"; };
            };
            "Mod+Space" = {
              spawn = "fuzzel";
              _attrs = { hotkey-overlay-title = "Run an Application: fuzzel"; };
            };
            "Mod+E" = { 
              spawn = ["${self'.packages.myTerminal}/bin/kitty" "${self'.packages.myTools}/bin/yazi"]; 
              _attrs = { hotkey-overlay-title = "Open File Manager: yazi"; }; 
            };
          };
        in navigation // system // apps;
      };
    };
  };

  flake.nixosModules.niri = { pkgs, ... }: {
    programs.niri.enable = true;
    programs.niri.package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;

    environment.systemPackages = with pkgs; [
      vim
      wget
      swaybg
      xwayland-satellite
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
