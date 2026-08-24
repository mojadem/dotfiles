{ config, ... }:

{
  xdg.configFile."tmux" = {
    source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/dev/mojadem/dotfiles/modules/home/programs/tmux/config";
  };
}
