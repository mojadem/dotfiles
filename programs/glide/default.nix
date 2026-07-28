{ username, ... }:

{
  home-manager.users.${username} = ./home.nix;
}
