{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home
    ../../modules/home/apps.nix
    ../../modules/home/darwin.nix
    ../../modules/home/email.nix
  ];

  home.packages = with pkgs; [
    mark
  ];

  programs.glide-browser.extraConfig = builtins.readFile ../../programs/glide/config/diamond.glide.ts;
}
