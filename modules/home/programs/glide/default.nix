{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.glide-browser;
  files = lib.sort builtins.lessThan (lib.filesystem.listFilesRecursive ./config/conf.d);
in

{
  imports = [
    inputs.glide.homeModules.default
  ];

  options.programs.glide-browser.extraConfig = lib.mkOption {
    type = lib.types.lines;
    default = "";
  };

  config = {
    programs.glide-browser = {
      enable = true;
      # Preserve the native macOS launcher so LaunchServices can deliver URLs.
      package = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin (
        inputs.glide.packages.${pkgs.stdenv.hostPlatform.system}.glide-browser-bin-unwrapped
      );
    };
    xdg.configFile."glide/glide.ts".text = lib.concatStringsSep "\n" (
      (map builtins.readFile files) ++ [ cfg.extraConfig ]
    );
  };
}
