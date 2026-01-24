{
  inputs,
  config,
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

  services.openssh.enable = true;

  # audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  security.rtkit.enable = true; # real-time audio

}
