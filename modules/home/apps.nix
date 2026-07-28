{ pkgs, ... }:

{
  imports = [
    ./programs/ghostty.nix
  ];

  home.packages = with pkgs; [
    discord
    spotify
  ];
}
