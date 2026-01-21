{ self, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    self.nixosModules.default
    self.nixosModules.gaming
    self.nixosModules.plasma
    self.nixosModules.sway
  ];

  home-manager = {
    users.mojadem = ./home.nix;
    extraSpecialArgs = { inherit self; };
  };

  networking.hostName = "club";
  system.stateVersion = "25.11";

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1"; # Fix scaling for electron apps.
    };

    systemPackages = with pkgs; [
      btop-rocm
    ];
  };

  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
  };
}
