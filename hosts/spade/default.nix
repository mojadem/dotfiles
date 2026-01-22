{
  self,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    self.nixosModules.default
  ];

  home-manager = {
    users.mojadem = ./home.nix;
    extraSpecialArgs = { inherit self; };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "spade";
  system.stateVersion = "25.11";

  environment.systemPackages = with pkgs; [
    moonlight-qt
  ];

  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };

  hardware.xpadneo.enable = true;

  # programs.gamescope = {
  #   enable = true; # Installs gamescope
  #   capSysNice = true; # Allows gamescope to set process priority for better performance
  # };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.moonlight-qt}/bin/moonlight";
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

  users.users.mojadem.extraGroups = [
    "input"
    "video"
  ];
}
