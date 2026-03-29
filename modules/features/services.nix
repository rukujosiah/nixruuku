{ self, ... }: {
  flake.nixosModules.services = { config, lib, pkgs, ... }: {
    services.getty.autologinUser = "ruuku";
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
    services.openssh.enable = true;
    services.tailscale.enable = true;
  };
}
