{ config, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = builtins.readFile ./config/config.fish;
  };

  xdg.configFile = {
    "fish/conf.d" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dev/mojadem/dotfiles/modules/home/programs/fish/config/conf.d";
    };
    "fish/functions" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dev/mojadem/dotfiles/modules/home/programs/fish/config/functions";
    };
  };
}
