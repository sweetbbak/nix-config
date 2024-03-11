{
  pkgs,
  config,
  ...
}: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # This configuration may be unnecessary and does not work with bluez5 (Unknown key Enable for group General ).
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
  services.blueman.enable = true;
}
