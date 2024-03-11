{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./web-search.nix
    ./emoji-picker.nix
    ./squirtle.nix
  ];
}
