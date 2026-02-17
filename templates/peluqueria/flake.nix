{
  description = "SaaS booking app devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    devenv.url = "github:cachix/devenv";
    devenv.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, devenv, ... }:
  let
    system = "x86_64-linux";
  in {
    devShells.${system}.default =
      devenv.lib.mkShell {
        inherit inputs system;
        modules = [ ./devenv.nix ];
      };
  };
}

