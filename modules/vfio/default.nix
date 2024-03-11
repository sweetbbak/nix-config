{
  pkgs,
  config,
  ...
}: {
  boot.initrd.availableKernelModules = ["amdgpu" "vfio-pci"];
  boot.kernelModules = [
    "vfio"
    "vfio_pci"
    "vfio_iommu_type1"
    "kvm-intel"
  ];
  boot.kernelParams = [
    "intel_iommu=on"
    "iommu=pt"
    "vfio-pci.ids=10de:2489,10de:228b"
  ];
  environment.systemPackages = with pkgs; [
    looking-glass-client
    scream
  ];

  systemd.tmpfiles.rules = [
    "f /dev/shm/scream 0660 sweet qemu-libvirtd -"
    "f /dev/shm/looking-glass 0660 sweet qemu-libvirtd -"
  ];

  # hotplug devices
  virtualisation.spiceUSBRedirection.enable = true;

  systemd.user.services.scream-ivshmem = {
    enable = true;
    description = "Scream IVSHMEM";
    serviceConfig = {
      ExecStart = "${pkgs.scream}/bin/scream-ivshmem-pulse /dev/shm/scream";
      Restart = "always";
    };
    wantedBy = ["multi-user.target"];
    requires = ["pulseaudio.service"];
  };
}
