{ pkgs }:

{
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
}
