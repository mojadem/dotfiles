{ pkgs, ... }:

let
  kodi = pkgs.kodi-gbm.withPackages (p: [ p.joystick ]);
  kiosk-session = pkgs.writeShellScript "kiosk-session" ''
    while true; do
      ${pkgs.cage}/bin/cage -s -- ${pkgs.moonlight-qt}/bin/moonlight
      ${kodi}/bin/kodi-standalone
    done
  '';
in
{
  hardware.graphics = {
    # Enables hardware acceleration.
    enable = true;
    extraPackages = with pkgs; [
      # Provides Intel N95 hardware video decoding for moonlight.
      intel-media-driver
    ];
  };

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = kiosk-session;
      user = "mojadem";
    };
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  security.rtkit.enable = true;

  users.users.mojadem.extraGroups = [
    # Maybe needed for fixing RTSP handshake errors between sunshine/moonlight.
    "audio"
    # Needed for access input devices (/dev/input/*).
    "input"
    # Needed for hardware decoding in moonlight (/dev/dri/renderD*).
    "render"
  ];
}
