{
  projectRootFile = "flake.nix";

  programs = {
    fish_indent.enable = true;
    just.enable = true;
    nixfmt.enable = true;
    prettier = {
      enable = true;
      includes = [
        "*.ts"
        "*.json"
      ];
    };
  };
}
