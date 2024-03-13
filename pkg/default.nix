{config, ...}: {
  imports = [
    ./cli.nix
    ./dev.nix
    ./wayland.nix
    ./system.nix
    ./utils.nix
    ./compression.nix
    ./gaming.nix
    ./desktop.nix
    ./nix-tools.nix
  ];
}
