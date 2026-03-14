{ ... }: {
  flake = {
    theme = {
      
      # Cirno 

      # base00 = "294271"; # Background (Dark Blue)
      # base01 = "324a7d"; # Lighter Background
      # base02 = "3b5289"; # Selection Background
      # base03 = "445a95"; # Comments / Inactive
      # base04 = "b7c1df"; # Dark White
      # base05 = "F1ECEC"; # Foreground (White)
      # base06 = "f8f6f6"; # Light White
      # base07 = "ffffff"; # Brighter White
      # base08 = "960D14"; # Red (Ribbon)
      # base09 = "ff8c00"; # Orange (Accent)
      # base0A = "ffd700"; # Yellow
      # base0B = "90ee90"; # Green
      # base0C = "B7E2EF"; # Light Blue (Ice)
      # base0D = "539CC1"; # Blue (Dress)
      # base0E = "e0b0ff"; # Magenta
      # base0F = "8b4513"; # Brown

      # Base16 Nord (official palette mapping)

      base00 = "2E3440"; # nord0  - Polar Night (background)
      base01 = "3B4252"; # nord1
      base02 = "434C5E"; # nord2
      base03 = "4C566A"; # nord3

      base04 = "D8DEE9"; # nord4
      base05 = "E5E9F0"; # nord5 (default foreground)
      base06 = "ECEFF4"; # nord6
      base07 = "8FBCBB"; # nord7 (bright fg / accents)

      base08 = "BF616A"; # nord11 - red
      base09 = "D08770"; # nord12 - orange
      base0A = "EBCB8B"; # nord13 - yellow
      base0B = "A3BE8C"; # nord14 - green
      base0C = "88C0D0"; # nord8  - cyan
      base0D = "81A1C1"; # nord9  - blue
      base0E = "B48EAD"; # nord15 - purple
      base0F = "5E81AC"; # nord10 - deep blue
    };
    fonts = {
      monospace = "JetBrainsMono Nerd Font Mono";
      sansSerif = "JetBrainsMono Nerd Font";
      size = 11;
    };
  };
}
