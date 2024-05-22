{
  pkgs,
  config,
  lib,
  # sops-nix,
  ...
}: {
  # imports = [<sops-nix/modules/sops>];
  services.tailscale.enable = true;

  # networking.firewall.allowedUDPPorts = [
  #   ${services.tailscale.port}
  # ];

  # sops.defaultSopsFile = ../secrets/tailscale.yaml;
  # sops.secrets = {
  #   tskey_auth = {
  #     owner = "sweet";
  #     group = "users";
  #   };
  # };

  systemd.services.tailscale-autoconnect = {
    description = "Automatic connection to Tailscale";

    # make sure tailscale is running before trying to connect to tailscale
    after = ["network-pre.target" "tailscale.service"];
    wants = ["network-pre.target" "tailscale.service"];
    wantedBy = ["multi-user.target"];

    # set this service as a oneshot job
    serviceConfig.Type = "oneshot";

    # have the job run this shell script
    script = ''
      # wait for tailscaled to settle
      sleep 2

      # check if we are already authenticated to tailscale
      status="$(${pkgs.tailscale}/bin/tailscale status -json | ${pkgs.jq}/bin/jq -r .BackendState)"
      if [ $status = "Running" ]; then # if so, then do nothing
        exit 0
      fi

      # otherwise authenticate with tailscale
      # ${pkgs.tailscale}/bin/tailscale up -authkey tskey-auth-kijSBk7pFp11CNTRL-23EkiMrGswTiruwZJ8TjwTpSrVXsP5p3
      # ${pkgs.tailscale}/bin/tailscale up -authkey $(cat /run/secrets/tskey_auth)
      ${pkgs.tailscale}/bin/tailscale up -authkey ${builtins.readFile /etc/nixos/.tailscale.txt}
    '';
  };
}
