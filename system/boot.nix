{
  pkgs,
  config,
  ...
}: {
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernel.sysctl = {
    "fs.inotify.max_user_instances" = 4096;
    "fs.inotify.max_user_watches" = 524288;
    "vm.max_map_count" = 16777216;
    "kernel.sysrq" = 1; # enables the very special sysrq key combo https://en.wikipedia.org/wiki/Magic_SysRq_key
  };

  boot.consoleLogLevel = 1;
  boot.loader.systemd-boot.configurationLimit = 9;

  boot.plymouth = {
    enable = true;
    themePackages = [pkgs.adi1090x-plymouth-themes];
    theme = "metal_ball";
  };

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
