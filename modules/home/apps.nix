{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bitwarden-desktop
    discord
    ghostty
    firefox
    spotify
    qbittorrent
    protonvpn-gui
  ];
}
