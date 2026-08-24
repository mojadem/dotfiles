{ pkgs, ... }:

{
  imports = [
    ./programs/ghostty.nix
    ./programs/glide
  ];

  home.packages = with pkgs; [
    discord
    spotify
  ];
}
