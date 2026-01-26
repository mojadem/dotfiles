{ ... }:

{
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;
  };

  users.users.mojadem.extraGroups = [
    "video"
    "render"
  ];
}
