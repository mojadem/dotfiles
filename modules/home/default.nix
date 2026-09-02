{ config, pkgs, ... }:

{
  imports = [
    ./programs/fish
    ./programs/pi
    ./programs/tmux
  ];

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    age
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    bat
    chafa
    fd
    ffmpeg
    figlet
    fzf
    gh
    git
    glow
    gnupg
    hyperfine
    jq
    just
    kakoune
    kakoune-lsp
    lazygit
    mdformat
    moreutils
    ncdu
    nixfmt
    par
    pi-coding-agent
    prettier
    rclone
    ripgrep
    rsync
    shfmt
    sl
    stow
    stylua
    tealdeer
    tmux
    tree
    typescript-language-server
    unzip
    wget
    yamlfmt
    yubikey-manager
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-curses;
    defaultCacheTtl = 86400;
    maxCacheTtl = 86400;
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Matt Dembiczak";
        email = "matt@dembiczak.net";
      };
    };
  };

  programs.password-store = {
    enable = true;
    settings = {
      PASSWORD_STORE_DIR = "${config.xdg.dataHome}/pass";
    };
  };

  xdg.enable = true;
}
