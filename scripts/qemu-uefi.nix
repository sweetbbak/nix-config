{pkgs, ...}: let
  qemu-uefi = pkgs.writeShellScriptBin "qemu-uefi" ''
    qemu-system-x86_64 \
      -bios ${pkgs.OVMF.fd}/FV/OVMF.fd \
      "$@"
  '';
in {
  environment.systemPackages = [qemu-uefi];
}
