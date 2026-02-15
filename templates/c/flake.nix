{
  description = "C devshell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    devShells.${system}.default = pkgs.mkShell {

      packages = with pkgs; [
        gcc
        gdb
        cmake
        gnumake
        pkg-config
        clang-tools # clangd 🔥
      ];

      shellHook = ''
        echo "C devshell ready 🚀"
      '';
    };
  };
}
