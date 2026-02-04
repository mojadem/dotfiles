{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mangohud
  ];

  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamemode.enable = true;
}
