{ pkgs, ... }:

{
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
      recolor = true;
      recolor-darkcolor = "#ebdbb2";
      recolor-lightcolor = "#282828";
      default-bg = "#1d2021";
    };
  };
}
