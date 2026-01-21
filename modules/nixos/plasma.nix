{ pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    baloo-widgets
    dolphin-plugins
    kate # text editor
    khelpcenter
    konsole
    krdp # remote desktop
    plasma-browser-integration # kde connect extension
    # ark # archive manager
    # elisa # music player
    # ffmpegthumbs # thumbnails in file manager
    # gwenview
    # okular # PDF viewer
    # spectacle # screenshot tool
  ];
}
