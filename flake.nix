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

    # anime game launcher
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    # Or, if you follow Nixkgs release 24.05:
    # aagl.url = "github:ezKEa/aagl-gtk-on-nix/release-24.05";
    aagl.inputs.nixpkgs.follows = "nixpkgs"; # Name

    # hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1"; # follows development branch of hyprland
    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland"; # to make sure that the plugin is built for the correct version of hyprland
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    hyprland,
    nix-ld,
    aagl,
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
        # {
        #   programs.hyprland.enable = true;
        #   programs.hyprland.extraConfig = ''
        #     plugin = ${inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors}/lib/libhypr-dynamic-cursors.so
        #   '';
        # }
        ./configuration.nix
        ./hypr.nix
        {
          imports = [aagl.nixosModules.default];
          nix.settings = aagl.nixConfig; # Set up Cachix
          programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
          # programs.anime-games-launcher.enable = true;
          # programs.anime-borb-launcher.enable = true;
          # programs.honkers-railway-launcher.enable = true;
          # programs.honkers-launcher.enable = true;
          programs.wavey-launcher.enable = true;
        }
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
