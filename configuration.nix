{
  pkgs,
  inputs,
  ...
}: {
  nix = {
    # package = pkgs.nixUnstable;
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      warn-dirty = false
    '';
  };
  imports = [
    ./hardware-configuration.nix
    ./system.nix
    ./system
    ./scripts
    ./pkg
    ./modules
    ./pkgs
    ./modules/vfio
  ];

  nixpkgs.config.allowUnfree = true;
  security.sudo.wheelNeedsPassword = false;

  networking.extraHosts = "192.168.0.102 localpi";

  # networking.nameservers = [
  #   "192.168.0.102"
  #   "1.1.1.1"
  # ];

  networking.hostName = "nixos"; # Define your hostname.

  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Temporary fix for build failure
  systemd.services.NetworkManager-wait-online.enable = false;

  services.qemu-passthrough.enable = false;
  # services.vfio.enable = true;
  # services.hardware.openrgb.enable = true;

  users.users.sweet = {
    isNormalUser = true;
    extraGroups = ["input" "audio" "video" "libvirtd" "wheel" "sweet" "kvm" "qemu-libvirtd" "docker"];
    hashedPassword = "$y$j9T$5596WzgwKgpzq4E5egZEY1$jKm8wQ.Dbs7KjfI.LUyp6rHkqZAjD9fviSPtQtxX5xC";
    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
      tree
    ];
  };

  nix.settings.trusted-users = ["root" "sweet" "@wheel"];
  nix.settings.allowed-users = ["sweet" "@wheel"];

  programs.zsh.enable = true;
  environment.pathsToLink = ["/share/zsh"];
  environment.shells = with pkgs; [zsh bash];

  # environment.homeBinInPath = true;
  environment.variables = {
    FREETYPE_PROPERTIES = "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
  };

  fonts.fontconfig = {
    hinting.enable = true;
    hinting.style = "medium"; # none slight medium full - slight is fuzzy and full is stiffer
  };

  system.build.manual.manual.enable = true;
  documentation = {
    dev.enable = true;
    doc.enable = true;
    man.enable = true;
  };

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };

  # networking.firewall.enable = false;
  networking.firewall.extraCommands = ''
    iptables -A nixos-fw -p tcp --source 192.0.2.0/24 --dport 10:33333 -j nixos-fw-accept || true
    iptables -A nixos-fw -p udp --source 192.0.2.0/24 --dport 10:33333 -j nixos-fw-accept || true
  '';

  networking.firewall.extraStopCommands = ''
    iptables -D nixos-fw -p tcp --source 192.0.2.0/24 --dport 10:33333 -j nixos-fw-accept || true
    iptables -D nixos-fw -p udp --source 192.0.2.0/24 --dport 10:33333 -j nixos-fw-accept || true
  '';

  # environment.systemPackages = with pkgs; [
  #   # ...
  #   inputs.matugen.packages.${system}.default
  # ];

  system.stateVersion = "23.11";
}
