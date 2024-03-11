{
  pkgs,
  config,
  lib,
  ...
}: {
  # List services that you want to enable:
  services.openssh.enable = true;
  services.fstrim.enable = true;

  programs = {
    dconf.enable = true;
    mtr.enable = true;
    fuse.userAllowOther = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal
    ];
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  hardware.pulseaudio.enable = false;
  sound.enable = true;
  security.rtkit.enable = true;
  programs.thunar.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };
}
