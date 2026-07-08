{ pkgs, ... }:

{
  imports = [ ./programs/ghostty.nix ];

  home.packages = with pkgs; [
    discord
    firefox
    proton-vpn
    qbittorrent
    spotify
  ];

}
