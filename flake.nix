# /etc/nixos/flake.nix
{
  description = "my sweet snowflake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";
    nyxpkgs.url = "github:NotAShelf/nyxpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-ld,
    home-manager,
    ...
  }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        nix-ld.nixosModules.nix-ld
        ./configuration.nix
      ];
    };

    # or for Home Manager
    homeConfigurations.nixos = inputs.home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = {inherit inputs;};

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };

      modules = [
        # ./home.nix
        /home/sweet/.config/home-manager/home.nix
        # ...
      ];
    };
  };
}
#   outputs = {
#     self,
#     nix-ld,
#     nixpkgs,
#     ...
#   } @ inputs: {
#     nixosConfigurations = {
#       nixos = nixpkgs.lib.nixosSystem {
#         system = "x86_64-linux";
#         specialArgs = {inherit inputs;};
#         modules = [
#           nix-ld.nixosModules.nix-ld
#           ./configuration.nix
#         ];
#       };
#     };
#
#     # or for Home Manager
#     homeConfigurations.nixos = inputs.home-manager.lib.homeManagerConfiguration {
#       extraSpecialArgs = {inherit inputs;};
#
#       pkgs = import nixpkgs {
#         system = "x86_64-linux";
#         config.allowUnfree = true;
#       };
#
#       modules = [
#         # ./home.nix
#         # /home/sweet/.config/home-manager/home.nix
#         # ...
#       ];
#     };
#   };
# }

