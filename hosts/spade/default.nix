{
  inputs,
  pkgs,
  ...
}:

{
  networking.hostName = "spade";
  system.stateVersion = "25.11";

  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../../modules/nixos
    ../../modules/nixos/moonlight.nix
    ../../modules/nixos/controller.nix
  ];

  home-manager.users.mojadem = ./home.nix;

  services.openssh.enable = true;

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.gamescope}/bin/gamescope -f -W 3840 -H 2160 -- ${pkgs.moonlight-qt}/bin/moonlight";
        user = "mojadem";
      };
    };
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable low-latency audio. This may or may not be necessary.
  security.rtkit.enable = true;
}
