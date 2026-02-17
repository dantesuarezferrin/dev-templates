{
  inputs = {
    nixpkgs.url = "github:cachix/devenv-nixpkgs/rolling";
    devenv.url = "github:cachix/devenv";

    nixpkgs.follows = "devenv/nixpkgs";
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

