{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    package = if pkgs.stdenv.hostPlatform.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;
    settings = {
      auto-update = "off";
      confirm-close-surface = false;
      cursor-style = "block";
      cursor-style-blink = false;
      font-family = "Monaspace Neon";
      font-size = 14;
      keybind = [
        "alt+arrow_left=unbind"
        "alt+arrow_right=unbind"
      ];
      macos-titlebar-style = "hidden";
      shell-integration = "none";
      theme = "Gruvbox Dark";
      window-padding-x = 6;
      window-padding-y = 6;
    };
  };
}
