{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  fonts.packages = with pkgs; [
    monaspace
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  users.users.mojadem = {
    description = "Matt Dembiczak";
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  i18n.defaultLocale = "en_US.UTF-8";
  networking.networkmanager.enable = true;
  nixpkgs.config.allowUnfree = true;
  programs.fish.enable = true;
  security.sudo.wheelNeedsPassword = false;
  time.timeZone = "America/New_York";

  # TODO: security.rtkit.enable?
}
