{ pkgs, ... }:

{
  imports = [
    ./programs/ghostty.nix
    ./programs/glide
  ];

  home.packages = with pkgs; [
    bitwarden-desktop
    discord
    spotify
  ];
}
