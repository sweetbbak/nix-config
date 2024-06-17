# /etc/nixos/flake.nix
{
  description = "my sweet snowflake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";

    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";

    hyprland = {
      url = "github:hyprwm/hyprland?ref=v0.40.0";
      # url = "github:hyprwm/Hyprland";
      # url = "github:hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nyxpkgs.url = "github:NotAShelf/nyxpkgs";
    sops-nix.url = "github:Mic92/sops-nix";

    scenefx.url = "github:wlrfx/scenefx?rev=e6bc2467d43219f4b06beb3e750b66d444b679b2";
    scenefx.inputs.nixpkgs.follows = "nixpkgs";

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    matugen = {
      url = "github:InioX/Matugen";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    hyprland,
    nix-ld,
    sops-nix,
    ...
  }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      # Set all inputs parameters as special arguments for all submodules,
      # so you can directly use all dependencies in inputs in submodules
      specialArgs = {inherit inputs;};

      modules = [
        nix-ld.nixosModules.nix-ld
        sops-nix.nixosModules.sops
        hyprland.nixosModules.default
        {programs.hyprland.enable = true;}
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
        ./pkgs
        # ./home.nix
        # /home/sweet/.config/home-manager/home.nix
        # ...
      ];
    };
  };
}
