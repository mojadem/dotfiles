{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alsa-utils
    fluidsynth
    pipewire.jack
    qsynth
    soundfont-fluid
    soundfont-generaluser-gs
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
