{ self, ... }: {
  flake.nixosModules.japanese = { config, lib, pkgs, ... }: {
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
    fonts.packages = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      ipafont
      kochi-substitute
    ];
    environment.systemPackages = with pkgs; [
      lutris
      wineWow64Packages.stable
      winetricks
    ];
  };
}
