{ config, ... }:

{
  xdg.configFile."kak" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dev/mojadem/dotfiles/modules/home/programs/kak/config";
  };
}
