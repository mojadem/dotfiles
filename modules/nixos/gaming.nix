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
    package = pkgs.steam.override {
      extraEnv = {
        PROTON_ENABLE_WAYLAND = "1";
      };
    };
  };

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
}
