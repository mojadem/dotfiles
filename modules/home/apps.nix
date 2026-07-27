{ pkgs, ... }:

{
  imports = [
    ./programs/firefox.nix
    ./programs/ghostty.nix
    ./programs/glide.nix
  ];

  home.packages = with pkgs; [
    discord
    spotify
  ];
}
