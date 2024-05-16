{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    steam-tui
    steamcmd
    lutris
    wine
    wine64Packages.full
    winetricks
    obs-studio
    gamescope
    # yuzu-ea

    # ryujinx
    # rpcs3
    dolphin-emu
    retroarchFull

    # minecraft
    prismlauncher
    fabric-installer
  ];
}
