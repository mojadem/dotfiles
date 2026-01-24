{ ... }:

{
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  hardware.xpadneo.enable = true;
}
