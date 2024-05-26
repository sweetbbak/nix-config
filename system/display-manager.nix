{
  pkgs,
  config,
  lib,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
             --time --cmd Hyprland \
            --sessions ${config.services.displayManager.sessionData.desktops}/share/xsessions:${config.services.displayManager.sessionData.desktops}/share/wayland-sessions:/run/current-system/sw/share/wayland-sessions/:/run/current-system/sw/share/xsessions/ \
            --remember \
            --remember-user-session \
            --user-menu \
            --power-shutdown /run/current-system/systemd/bin/systemctl poweroff \
            --power-reboot /run/current-system/systemd/bin/systemctl reboot
        '';
        # user = "sweet";
        user = "greeter";
      };
    };
  };

  environment.etc = {
    "greetd/environments".text = lib.mkAfter ''
      dwl
    '';
    "greetd/sessions/dwl.dekstop".text = ''
      [Desktop Entry]
      Name=dwl
      Comment=dwm for Wayland
      Exec=dwl
      Type=Application
    '';
    "greetd/sessions/sway-fx.dekstop".text = ''
      [Desktop Entry]
      Name=swayfx
      Comment=swayfx version of sway
      Exec=sway
      Type=Application
    '';
  };
}
