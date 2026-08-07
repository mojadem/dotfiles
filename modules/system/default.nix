{
  pkgs,
  username,
  inputs,
  ...
}:

{
  imports = [ ../../programs/fish ];

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
    extraSpecialArgs = { inherit inputs; };
  };

  users.users.${username} = {
    description = "Matt Dembiczak";
    shell = pkgs.fish;
  };

  nixpkgs.config.allowUnfree = true;
  time.timeZone = "America/New_York";
}
