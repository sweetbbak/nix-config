{config, ...}: {
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  hardware.graphics = {
    enable = true;
    # driSupport = true;
    enable32Bit = true;
    # extraPackages = [];
    # extraPackages32 = [];
  };

  services.xserver.videoDrivers = ["nvidia" "amdgpu"];
}
