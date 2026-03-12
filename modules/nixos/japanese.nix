{ pkgs, ... }:

{
  # Japanese Locale Support
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "ja_JP.UTF-8/UTF-8"
  ];

  # Fonts for Japanese/CJK support
  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    ipafont
    kochi-substitute
  ];

  # Lutris and Gaming Dependencies for VNs
  environment.systemPackages = with pkgs; [
    lutris
    wineWow64Packages.staging
    winetricks
    
    # GStreamer plugins for game movies/cutscenes
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    
    # Utilities often needed for VNs
    libfaketime # Sometimes used for bypasses
  ];

  # Ensure icons are available for Lutris/Wine apps
  services.udev.packages = [ pkgs.gnome-settings-daemon ];
}
