{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    mdformat
    nixfmt-rfc-style
  ];
}
