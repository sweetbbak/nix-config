{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nix-init # create a nix project
    nix-index # file database for nix
    nix-prefetch # get sha/hash info for flakes
    nixpkgs-lint
    nixpkgs-fmt
    nixfmt-classic
  ];
}
