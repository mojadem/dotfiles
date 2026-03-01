{ pkgs, ... }:

{
  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      cliphist
      fuzzel
      grim
      mako
      mpv
      slurp
      swayimg
      wl-clipboard
    ];
  };
}
