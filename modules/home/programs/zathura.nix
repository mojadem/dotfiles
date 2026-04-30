{ pkgs, ... }:

{
  programs.zathura = {
    # TODO: re-enable once https://github.com/NixOS/nixpkgs/issues/514738 is closed
    enable = false;
    options = {
      default-bg = "#1d2021";
      recolor-darkcolor = "#ebdbb2";
      recolor-lightcolor = "#282828";
      recolor = true;
      selection-clipboard = "clipboard";
      window-title-basename = true;
    };
  };
}
