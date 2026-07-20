{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      ...
    }@inputs:

    let
      overlaysModule = {
        nixpkgs.overlays = [
          (import ./overlays/pi-coding-agent)
        ];
      };
    in
    {
      nixosConfigurations = {
        club = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            username = "mojadem";
          };
          modules = [
            overlaysModule
            ./hosts/club
          ];
        };

        spade = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            username = "mojadem";
          };
          modules = [
            overlaysModule
            ./hosts/spade
          ];
        };
      };

      darwinConfigurations = {
        heart = nix-darwin.lib.darwinSystem {
          specialArgs = {
            inherit inputs;
            username = "mojadem";
          };
          modules = [
            overlaysModule
            ./hosts/heart
          ];
        };

        diamond = nix-darwin.lib.darwinSystem {
          specialArgs = {
            inherit inputs;
            username = "mattdembiczak";
          };
          modules = [
            overlaysModule
            ./hosts/diamond
          ];
        };
      };
    };
}
