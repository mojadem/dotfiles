{ username, ... }:

{
  services.sunshine = {
    enable = true;
    autoStart = false;
    capSysAdmin = true;
    openFirewall = true;
  };

  users.users.${username}.extraGroups = [
    "video"
    "render"
    "uinput"
  ];
}
