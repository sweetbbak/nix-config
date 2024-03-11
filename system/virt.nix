{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.virt-manager.enable = true;
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  services.spice-webdavd.enable = true;

  # virtualisation.libvirtd.qemu.ovmf.enable = true;
  # virtualisation.libvirtd.qemu.runAsRoot = false;
  environment.systemPackages = with pkgs; [
    OVMF
  ];

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      ovmf.enable = true;
      runAsRoot = true;
      ovmf.packages = [pkgs.OVMFFull.fd];
      swtpm.enable = true;
    };
    extraConfig = ''
      unix_sock_group = "libvirtd"
      unix_sock_ro_perms = "0770"
      unix_sock_rw_perms = "0770"

      auth_unix_ro = "none"
      auth_unix_rw = "none"


      # clear_emulator_capabilities = 0
    '';

    onBoot = "ignore";
    onShutdown = "shutdown";
  };
}
