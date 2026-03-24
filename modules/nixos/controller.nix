{ ... }:

{
  imports = [ ./bluetooth.nix ];

  hardware.bluetooth = {
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  hardware.xpadneo.enable = true;
}
