{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home
    ../../modules/home/darwin.nix
    ../../modules/home/email.nix
  ];

  home.packages = with pkgs; [
    mark
  ];
}
