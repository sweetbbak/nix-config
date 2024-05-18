{pkgs, ...}: {
  virtualisation.containers = {
    enable = true;
  };

  hardware.nvidia-container-toolkit.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = false;
    defaultNetwork.settings.dns_enabled = true;
  };

  # virtualisation.docker = {
  #   enable = true;
  #   enableNvidia = true;
  #   daemon.settings = {
  #     features = {
  #       cdi = true;
  #     };
  #   };
  # };

  environment.systemPackages = with pkgs; [
    distrobox
    nvidia-podman
    cudatoolkit
  ];
}
