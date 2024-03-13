{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nicotine-plus
    gtkcord4
    openutau
    sunvox
    zathura
    pavucontrol
    remmina
    virt-viewer
    qemu
    krita
    papirus-folders
    catppuccin-papirus-folders
    libnotify
    godot_4
    waydroid
    nvtop
    btop
    glxinfo
    networkmanagerapplet
    neovim
    helix
    mpv
    rofi
    wofi
    firefox
    gparted
    kitty
    eww
    catppuccin-cursors
    catppuccin-gtk
    catppuccin-papirus-folders
    rose-pine-gtk-theme
    tokyonight-gtk-theme
    imv
    transmission
  ];
}
