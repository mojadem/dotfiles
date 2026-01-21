{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bitwarden-desktop
    discord
    ghostty
    firefox
    spotify
    qbittorrent
    protonmail-bridge
    protonvpn-gui
  ];
}
