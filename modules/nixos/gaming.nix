{ pkgs, inputs, ... }:

{
  # Allow unfree packages for Steam and drivers
  nixpkgs.config.allowUnfree = true;

  # Graphics drivers
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # AMD GPU drivers (X11 and Wayland)
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Steam configuration
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true;
  };

  # Performance and tools
  programs.gamemode.enable = true;
  
  environment.systemPackages = with pkgs; [
    mangohud
    protonup-ng
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/ruuku/.steam/root/compatibilitytools.d";
  };
}
