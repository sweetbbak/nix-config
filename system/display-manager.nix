{
  pkgs,
  config,
  lib,
  ...
}: {
  # services.xserver.displayManager.sddm.wayland.enable = true;
  # services.desktopManager.plasma6.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
            --greeting "sweet@nixos ~$" \
            --time --cmd Hyprland \
            --sessions ${config.services.displayManager.sessionData.desktops}/share/xsessions:${config.services.displayManager.sessionData.desktops}/share/wayland-sessions:/run/current-system/sw/share/wayland-sessions/:/run/current-system/sw/share/xsessions/:/etc/greetd/sessions \
            --remember \
            --remember-user-session \
            --user-menu \
            --theme border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red \
            --power-shutdown /run/current-system/systemd/bin/systemctl poweroff \
            --power-reboot /run/current-system/systemd/bin/systemctl reboot
        '';
        user = "sweet";
        # user = "greeter";
      };
    };
  };

  environment.etc = {
    "greetd/environments".text = lib.mkAfter ''
      dwl
    '';

    "greetd/sessions/dwl.desktop".text = ''
      [Desktop Entry]
      Name=dwl
      Comment=dwm for Wayland
      Exec=/home/sweet/repos/dwl-custom/dwl
      Type=Application
    '';

    "greetd/sessions/sway-fx.desktop".text = ''
      [Desktop Entry]
      Name=swayfx
      Comment=swayfx version of sway
      Exec=env WLR_DRM_DEVICES=/dev/dri/card0:/dev/dri/card1 sway --unsupported-gpu
      Type=Application
    '';
  };
}
