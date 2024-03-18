{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lutris
    wine
    wine64Packages.full
    winetricks
    obs-studio
    gamescope
    yuzu-ea
    ryujinx
    rpcs3
    dolphin-emu
    retroarchFull

    # minecraft
    minecraft
    prismlauncher
    fabric-installer
  ];
}
