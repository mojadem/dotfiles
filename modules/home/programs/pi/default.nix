{ config, ... }:

let
  configDir = "${config.home.homeDirectory}/dev/mojadem/dotfiles/modules/home/programs/pi/config";

  link = name: {
    source = config.lib.file.mkOutOfStoreSymlink "${configDir}/${name}";
  };
in
{
  home.file = {
    ".pi/agent/AGENTS.md" = link "AGENTS.md";
    ".pi/agent/APPEND_SYSTEM.md" = link "APPEND_SYSTEM.md";
    ".pi/agent/keybindings.json" = link "keybindings.json";

    ".pi/agent/extensions" = link "extensions";
    ".pi/agent/prompts" = link "prompts";
    ".pi/agent/themes" = link "themes";
  };
}
