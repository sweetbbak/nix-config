{config, ...}: {
  imports = [
    ./boot.nix
    ./flatpak.nix
    ./disk.nix
    ./steam.nix
    ./virt.nix
    ./opengl.nix
    ./wm.nix
    ./polkit.nix
    ./display-manager.nix
    ./services.nix
    ./bluetooth.nix
    ./podman.nix
    ./appimage.nix
    ./fonts.nix
    ./binfmt.nix
    ./tailscale.nix
  ];
}
