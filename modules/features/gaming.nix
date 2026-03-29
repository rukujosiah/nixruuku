{ self, ... }: {
  flake.nixosModules.gaming = { config, lib, pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
    services.xserver.videoDrivers = [ "amdgpu" ];
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
    };
    programs.gamemode.enable = true;
    environment.systemPackages = with pkgs; [
      mangohud
      protonup-ng
    ];
    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "${config.users.users.ruuku.home}/.steam/root/compatibilitytools.d";
    };
  };
}
