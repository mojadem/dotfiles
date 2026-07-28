{
  inputs,
  lib,
  pkgs,
  ...
}:

let
  configDir = ./config;
  confDir = configDir + "/conf.d";

  files = lib.sort builtins.lessThan (
    builtins.filter (file: lib.hasSuffix ".ts" (toString file)) (
      lib.filesystem.listFilesRecursive confDir
    )
  );

  includeLines = map (
    file:
    let
      relativePath = lib.removePrefix "${toString configDir}/" (toString file);
    in
    "glide.include(${builtins.toJSON relativePath});"
  ) files;

  generatedManifest = pkgs.writeTextDir "conf.d.generated.ts" (
    lib.concatStringsSep "\n" includeLines
  );

  configWithManifest = pkgs.symlinkJoin {
    name = "glide-config";
    paths = [
      configDir
      generatedManifest
    ];
  };
in

{
  imports = [
    inputs.glide.homeModules.default
  ];

  programs.glide-browser.enable = true;

  xdg.configFile."glide" = {
    source = configWithManifest;
    recursive = true;
  };
}
