{
  self,
  config,
  pkgs,
  ...
}:

{
  imports = [
    self.homeModules.default
  ];
}
