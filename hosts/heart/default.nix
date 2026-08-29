{ inputs, username, ... }:

{
  networking.hostName = "heart";
  system.stateVersion = 6;

  homebrew.casks = [ "iina" ];

  imports = [
    inputs.home-manager.darwinModules.home-manager
    ../../modules/system
    ../../modules/darwin
  ];

  home-manager.users.${username} = ./home.nix;
}
