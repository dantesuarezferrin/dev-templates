{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    devenv.url = "github:cachix/devenv";
  };
	outputs = { self, nixpkgs, devenv, ... }@inputs:
	let
  	system = "x86_64-linux";
  	pkgs = import nixpkgs {
  	  inherit system;
  	};
	in {
  	devShells.${system}.default =
    	devenv.lib.mkShell {
      	inherit inputs pkgs;
      	modules = [ ./devenv.nix ];
    	};
	};
}

