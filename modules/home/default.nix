{ pkgs, ... }:

{
  imports = [
    ./programs/zathura.nix
  ];

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    age
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    bat
    btop
    claude-code
    dix
    fd
    ffmpeg
    fzf
    gh
    git
    gnupg
    just
    kakoune
    kakoune-lsp
    lazygit
    mdformat
    moreutils
    ncdu
    nixfmt
    pass
    pi-coding-agent
    rclone
    ripgrep
    rsync
    sl
    stow
    stylua
    tealdeer
    tmux
    tree
    typescript-language-server
    wget
    yamlfmt
    yubikey-manager
  ];

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-curses;
    defaultCacheTtl = 86400;
    maxCacheTtl = 86400;
  };

  xdg.enable = true;
}
