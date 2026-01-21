{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    {
      homeModules = {
        default = ./modules/home;
        apps = ./modules/home/apps.nix;
      };

      nixosModules = {
        default = ./modules/nixos;
        gaming = ./modules/nixos/gaming.nix;
        plasma = ./modules/nixos/plasma.nix;
        sway = ./modules/nixos/sway.nix;
      };

      nixosConfigurations = {
        club = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit self; };
          modules = [
            ./hosts/club
            home-manager.nixosModules.home-manager
          ];
        };
      };
    };
}
