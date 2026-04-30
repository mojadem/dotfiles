{ username, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";
  users.users.${username}.home = "/Users/${username}/";

  system.primaryUser = username; # needed for homebrew
  homebrew = {
    enable = true;
    taps = [
      "schappim/ocr"
    ];
    brews = [
      "schappim/ocr/ocr"
    ];
  };
}
