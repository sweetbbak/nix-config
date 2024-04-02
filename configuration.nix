{
  inputs,
  config,
  pkgs,
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
    ./modules/vfio
  ];

  nixpkgs.config.allowUnfree = true;
  security.sudo.wheelNeedsPassword = false;

  networking.hostName = "nixos"; # Define your hostname.

  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  users.users.sweet = {
    isNormalUser = true;
    extraGroups = ["input" "audio" "video" "libvirtd" "wheel" "sweet" "kvm" "qemu-libvirtd"];
    hashedPassword = "$y$j9T$5596WzgwKgpzq4E5egZEY1$jKm8wQ.Dbs7KjfI.LUyp6rHkqZAjD9fviSPtQtxX5xC";
    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
      tree
    ];
  };

  nix.settings.trusted-users = ["root" "sweet"];
  nix.settings.allowed-users = ["sweet"];

  programs.zsh.enable = true;
  environment.pathsToLink = ["/share/zsh"];
  environment.shells = with pkgs; [zsh bash];

  system.build.manual.manual.enable = true;
  documentation = {
    dev.enable = true;
    doc.enable = true;
    man.enable = true;
  };

  system.stateVersion = "23.11";
}
