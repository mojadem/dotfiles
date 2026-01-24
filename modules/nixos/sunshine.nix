{ ... }:

{
  services.sunshine = {
    enable = true;
    capSysAdmin = true;
    openFirewall = true;
  };

  users.users.mojadem.extraGroups = [
    "video"
    "render"
  ];
}
