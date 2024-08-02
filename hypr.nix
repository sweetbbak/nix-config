{
  pkgs,
  inputs,
  hyprland,
  system,
  hyprlandPlugins,
  ...
}: {
  programs.hyprland.enable = true;

  environment.systemPackages = [
    pkgs.hyprlandPlugins.hyprwinwrap
    # inputs.hyprland.${system}.hyprlandPlugins.hyprwinwrap
  ];

  # programs.hyprland.extraConfig = ''
  #   plugins = [inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors];
  # '';
  # wayland.windowManager.hyprland = {
  # enable = true;
  # plugins = [inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors];
  # };
}
