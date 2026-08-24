{ ... }:

{
  programs.fish = {
    enable = true;
    shellInit = builtins.readFile ./config/config.fish;
  };

  xdg.configFile = {
    "fish/conf.d" = {
      source = ./config/conf.d;
      recursive = true;
    };
    "fish/functions" = {
      source = ./config/functions;
      recursive = true;
    };
  };
}
