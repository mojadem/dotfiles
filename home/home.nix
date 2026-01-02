{ config, pkgs, ... }:

{
  imports = [
    ./modules/formatters.nix
  ];

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  home.username = "mojadem";
  home.homeDirectory = "/home/mojadem";

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    aerc
    audacity
    bat
    bitwarden-desktop
    cliphist
    discord
    fd
    firefox
    fuzzel
    fzf
    gamescope
    ghostty
    git
    just
    kakoune
    lazygit
    opencode
    pass
    protonmail-bridge
    protonvpn-gui
    qbittorrent
    ripgrep
    spotify
    stow
    tmux
    tree
    wget
    wl-clipboard
  ];

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    sway.enable = true;
  };

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-curses;
    defaultCacheTtl = 86400;
    maxCacheTtl = 86400;
  };
}
