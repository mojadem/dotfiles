{ pkgs, ... }:

{
  programs.zathura = {
    enable = true;
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
