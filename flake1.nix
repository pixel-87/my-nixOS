{
  description = "NixOS configuration with Hyprland";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        "default" = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/default/configuration.nix
            ./modules/nixos/hypr/hyprland.nix
            ./modules/nixos/waybar/waybar.nix
            (home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.pixel = import ./hosts/default/home.nix;
              home-manager.extraSpecialArgs = {
                inherit hyprland;
              };
            })
          ];
        };
      };
    };
}
