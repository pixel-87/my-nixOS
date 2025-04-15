{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-wsl, ... }@inputs: {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/default/configuration.nix
          home-manager.nixosModules.home-manager
        ];
        specialArgs = { inherit inputs; };
      };

    wsl = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
        modules = [
          ./hosts/wsl/configuration.nix
          home-manager.nixosModules.home-manager
          nixos-wsl.nixosModules.default
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
