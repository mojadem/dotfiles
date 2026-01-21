{ pkgs, ... }:

{
  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      cliphist
      foot
      fuzzel
      grim
      slurp
      mako
      wl-clipboard
    ];
  };
}
