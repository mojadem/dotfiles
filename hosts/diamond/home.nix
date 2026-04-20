{ config, ... }:

{
  imports = [
    ../../modules/home
    ../../modules/home/darwin.nix
    ../../modules/home/email.nix
  ];
}
