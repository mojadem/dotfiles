{ config, pkgs, ... }:

{
  imports = [
    ./programs/fish
    ./programs/kak
    ./programs/pi
    ./programs/tmux
  ];

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    age
    aspell
    aspellDicts.en
    bat
    chafa
    diffr
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
      signing = {
        backend = "ssh";
        behavior = "drop";
        backends.ssh.program = "${pkgs.openssh}/bin/ssh-keygen";
      };
      git.sign-on-push = true;

      aliases.vdiff = [
        "util"
        "exec"
        "--"
        "sh"
        "-c"
        ''
          jj log \
          	-r '..@' --no-graph --color=always \
            -T '
              change_id.short() ++ " " ++ separate(" ",
                coalesce(description.first_line(), "(no description set)"),
                bookmarks,
              ) ++ "\n"
            ' |
            fzf --ansi --no-sort --layout=reverse --wrap=word \
              --accept-nth '1' --with-nth '2..' \
              --bind 'pgup:preview-page-up,pgdn:preview-page-down' \
              --preview 'jj show --no-pager --color=always -r {1}' \
              --preview-window 'right:50%:wrap-word' \
              --with-shell 'sh -c'
        ''
      ];
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
