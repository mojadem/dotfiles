{ pkgs, ... }:

{
  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      cliphist
      fuzzel
      grim
      libnotify
      mako
      mpv
      slurp
      swayimg
      swaylock
      wl-clipboard
    ];
  };
}
