{ pkgs, ... }:

{
  home.packages = with pkgs; [
    qbittorrent
    proton-vpn
  ];
}
