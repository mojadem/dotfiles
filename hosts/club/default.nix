{ inputs, pkgs, username, ... }:

{
  networking.hostName = "club";
  system.stateVersion = "25.11";

  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../../modules/nixos
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/gaming.nix
    ../../modules/nixos/music.nix
    ../../modules/nixos/plasma.nix
    ../../modules/nixos/sunshine.nix
    ../../modules/nixos/sway.nix
  ];

  home-manager.users.${username} = ./home.nix;

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1"; # Fix scaling for electron apps.
    };

    systemPackages = with pkgs; [
      btop-rocm
    ];
  };
}
