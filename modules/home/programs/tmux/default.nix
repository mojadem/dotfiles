{ ... }:

{
  xdg.configFile."tmux" = {
    source = ./config;
    recursive = true;
  };
}
