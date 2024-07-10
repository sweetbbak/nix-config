{...}: {
  imports = [
    ./boot.nix
    ./flatpak.nix
    ./disk.nix
    ./steam.nix
    ./gpu.nix
    ./virt.nix
    ./polkit.nix
    ./tailscale.nix
    ./display-manager.nix
    ./services.nix
    ./bluetooth.nix
    ./podman.nix
    ./appimage.nix
    ./binfmt.nix
    ./fonts.nix
    # ./openrgb.nix
  ];
}
