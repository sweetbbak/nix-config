{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pulseaudioFull
    lxc
    virt-manager
    libguestfs
    podman-compose
    qt6.qtwayland
    pamixer
    android-tools
    libvirt
    libGLU
    libGL
    fuse
    sshfs
    polkit_gnome
    lm_sensors
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    xdg-user-dirs
    gtk-engine-murrine
    gtk_engines
    xdg-utils
  ];
}
