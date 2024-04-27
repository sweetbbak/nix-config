{pkgs, ...}: {
  virtualisation.waydroid.enable = true;
  environment.systemPackages = with pkgs; [
    sunshine
    ironbar
    sassc
    dart-sass
    brightnessctl
    stremio
    tailscale
    openvpn
    qbittorrent
    transmission_4
    firewalld
    okular
    bore
    bore-cli
    blender
    virtiofsd
    anki
    xfce.thunar-archive-plugin
    gnome.file-roller
    juno-theme
    # librum
    nicotine-plus
    google-chrome
    swaynotificationcenter
    kanata-with-cmd
    xorg.xhost
    sniffnet
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
    nvtopPackages.full
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
    wezterm
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
