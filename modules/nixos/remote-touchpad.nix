{ pkgs, username, ... }:

let
  remote-touchpad = pkgs.remote-touchpad.overrideAttrs (_: {
    # Use bare uinput backend, drop other dependencies.
    tags = [ "uinput" ];
    buildInputs = [ ];
  });
in
{
  systemd.services.remote-touchpad = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.kbd ];
    serviceConfig = {
      ExecStart = "${remote-touchpad}/bin/remote-touchpad -bind :8080";
      User = username;
      Group = "uinput";
      Restart = "on-failure";
    };
  };

  hardware.uinput.enable = true;
  networking.firewall.allowedTCPPorts = [ 8080 ];
}
