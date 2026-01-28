{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  fonts.packages = with pkgs; [
    monaspace
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  users.users.mojadem = {
    description = "Matt Dembiczak";
    shell = pkgs.fish;
  };

  nixpkgs.config.allowUnfree = true;
  programs.fish.enable = true;
  time.timeZone = "America/New_York";
}
