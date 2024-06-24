{
  description = "Qeden's NixOS System Flake";

  inputs = {
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-apple-silicon = {
      url = "github:tpwrules/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixos-apple-silicon,
    nixos-generators,
    nixos-cosmic,
    self,
    ...
  } @ inputs: let
    username = "quinn";
    system = "aarch64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = with inputs; [
        nixos-apple-silicon.overlays.apple-silicon-overlay
        nur.overlay
      ];
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      main = lib.nixosSystem {
        inherit system;
        modules = [(import ./modules/core)];
        specialArgs = {
          host = "lazarus";
          inherit self inputs username pkgs;
        };
      };
    };

    packages.aarch64-linux = {
      raw-efi = nixos-generators.nixosGenerate {
        inherit system;
        modules = [(import ./modules/core)];
        specialArgs = {
          host = "lazarus";
          inherit self inputs username pkgs;
        };
        format = "raw-efi";
      };
    };
  };
}
