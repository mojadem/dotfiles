{ pkgs, ... }:

{
  home.packages = with pkgs; [
    aerospace
    coreutils
  ];
}
