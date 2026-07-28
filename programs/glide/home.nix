{ inputs, lib, ... }:

let
  configFiles =
    lib.sort builtins.lessThan (
      builtins.filter (file: lib.hasSuffix ".ts" (toString file)) (
        lib.filesystem.listFilesRecursive ./config/conf.d
      )
    )
    ++ [ ./config/glide.ts ];

  config = lib.concatMapStringsSep "\n" builtins.readFile configFiles;
in

{
  imports = [
    inputs.glide.homeModules.default
  ];

  programs.glide-browser.enable = true;

  xdg.configFile."glide/glide.ts".text = config;
}
