{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wl-gammarelay-rs
    slurp
    swappy
    swayimg
    swaylock-effects
    grim
    swayidle
    wf-recorder
    wl-clipboard
    cliphist
    wtype
    hyprpicker
    wl-color-picker
    waybar
    mako
    wlogout
    swww
    nwg-look
    swayosd
    wl-clip-persist
  ];
}
