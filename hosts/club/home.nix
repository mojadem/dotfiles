{
  self,
  config,
  pkgs,
  ...
}:

{
  imports = [
    self.homeModules.default
    self.homeModules.apps
  ];

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;

    sway.enable = true;
    x11.enable = true;
    gtk.enable = true;
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    desktop = "${config.home.homeDirectory}/desktop";
    documents = "${config.home.homeDirectory}/documents";
    download = "${config.home.homeDirectory}/downloads";
    music = "${config.home.homeDirectory}/music";
    pictures = "${config.home.homeDirectory}/pictures";
    videos = "${config.home.homeDirectory}/videos";

    # Point unused dirs to home.
    templates = config.home.homeDirectory;
    publicShare = config.home.homeDirectory;
  };
}
