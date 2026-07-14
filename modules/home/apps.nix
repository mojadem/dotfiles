{ pkgs, ... }:

{
  imports = [
    ./programs/firefox.nix
    ./programs/ghostty.nix
  ];

  home.packages = with pkgs; [
    discord
    spotify
  ];
}
