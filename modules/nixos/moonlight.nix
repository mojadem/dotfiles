{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    moonlight-qt
  ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      # Hardware decoding for Intel N95.
      intel-media-driver
    ];
  };

  users.users.mojadem.extraGroups = [
    "input"
    "video"
  ];
}
