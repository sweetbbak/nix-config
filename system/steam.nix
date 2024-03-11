{
  pkgs,
  config,
  lib,
  ...
}: {
  # Steam Configuration
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  # TODO: add lutris, sys wine etc...
}
