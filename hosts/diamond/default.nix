{ inputs, username, ... }:

{
  networking.hostName = "diamond";
  system.stateVersion = 6;

  imports = [
    inputs.home-manager.darwinModules.home-manager
    ../../modules/system
    ../../modules/darwin
  ];

  home-manager.users.${username} = ./home.nix;
}
