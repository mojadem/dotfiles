{ inputs, ... }:

{
  imports = [
    inputs.glide.homeModules.default
  ];

  programs.glide-browser.enable = true;

  xdg.configFile."glide" = {
    source = ./config;
    recursive = true;
  };
}
