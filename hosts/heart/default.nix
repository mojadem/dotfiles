{ inputs, pkgs, ... }:

{
  networking.hostName = "heart";
  system.stateVersion = 6;

  imports = [
    inputs.home-manager.darwinModules.home-manager
    ../../modules/system
    ../../modules/darwin
  ];

  home-manager.users.mojadem = ./home.nix;
}
