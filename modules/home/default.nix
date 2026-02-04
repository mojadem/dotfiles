{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    bat
    claude-code
    fd
    fzf
    gh
    git
    just
    kakoune
    kakoune-lsp
    lazygit
    mdformat
    moreutils
    nixfmt
    nvd
    pass
    ripgrep
    stow
    tmux
    tree
    wget
  ];

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-curses;
    defaultCacheTtl = 86400;
    maxCacheTtl = 86400;
  };
}
