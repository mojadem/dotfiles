{ ... }:

{
  home.file.".pi/agent" = {
    source = ./config;
    recursive = true;
  };
}
