{ pkgs, ... }:

{
  home.packages = [
    (pkgs.slstatus.override {
      conf = builtins.readFile ./config.h;
    })
  ];
}
