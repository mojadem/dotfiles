{ inputs, username, ... }:

{
  networking.hostName = "spade";
  system.stateVersion = "25.11";

  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../../modules/nixos
    ../../modules/nixos/controller.nix
    ../../modules/nixos/kiosk.nix
  ];

  home-manager.users.${username} = ./home.nix;

  services.openssh.enable = true;

}
