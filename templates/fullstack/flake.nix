{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    devenv.url = "github:cachix/devenv";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.devenv.flakeModule ];
      systems = [ "x86_64-linux" ]; # Podés agregar "aarch64-darwin" si un amigo usa Mac

      perSystem = { config, self', inputs', pkgs, system, ... }: {
        devenv.shells.default = {
          devenv.root = ./.; 

          imports = [ ./devenv.nix ];
        };
      };
    };
}
