{
  pkgs,
  inputs,
  ...
}: {
  programs.hyprland.enable = true;
  # programs.hyprland.extraConfig = ''
  # plugins = [inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors];
  # '';
  # wayland.windowManager.hyprland = {
  # enable = true;
  # plugins = [inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors];
  # };
}
