{
  config,
  pkgs,
  ...
}: {
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  services.xserver.videoDrivers = ["nvidia" "amdgpu"];
}
