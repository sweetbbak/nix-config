{
  pkgs,
  config,
  ...
}: {
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernel.sysctl = {"vm.max_map_count" = 2147483642;};
  boot.consoleLogLevel = 1;
  boot.loader.systemd-boot.configurationLimit = 9;

  # boot.kernelPackages = pkgs.linuxPackages;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  # boot.kernelPackages = pkgs.linuxPackages_lqx;
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  # This is for OBS Virtual Cam Support - v4l2loopback setup
  boot.kernelModules = ["v4l2loopback"];
  boot.extraModulePackages = [
    config.boot.kernelPackages.v4l2loopback
    pkgs.linuxPackages_zen.kvmfr
  ];
}
