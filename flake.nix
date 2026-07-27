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
    glide = {
      url = "github:glide-browser/glide.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
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

    {
      nixosConfigurations = {
        club = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            username = "mojadem";
          };
          modules = [ ./hosts/club ];
        };

        spade = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            username = "mojadem";
          };
          modules = [ ./hosts/spade ];
        };
      };

      darwinConfigurations = {
        heart = nix-darwin.lib.darwinSystem {
          specialArgs = {
            inherit inputs;
            username = "mojadem";
          };
          modules = [ ./hosts/heart ];
        };

        diamond = nix-darwin.lib.darwinSystem {
          specialArgs = {
            inherit inputs;
            username = "mattdembiczak";
          };
          modules = [ ./hosts/diamond ];
        };
      };
    };
}
