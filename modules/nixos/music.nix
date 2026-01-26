{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alsa-utils
    pipewire.jack
    fluidsynth
    qsynth
    soundfont-fluid
    soundfont-generaluser
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
