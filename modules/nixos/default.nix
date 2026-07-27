{ pkgs, username, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  i18n.defaultLocale = "en_US.UTF-8";
  networking.networkmanager.enable = true;
  security.sudo.wheelNeedsPassword = false;
}
