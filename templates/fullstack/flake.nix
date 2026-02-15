{
  description = "Fullstack devshell template";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    devShells.${system}.default =
      pkgs.mkShell {

        packages = with pkgs; [

          ### React / Web
          nodejs_20
          nodePackages.pnpm

          ### Python
          python3

          ### Database
          postgresql

          ### Utils
          git
          gcc
          gnumake
        ];

        shellHook = ''
          echo ""
          echo "🚀 Dante devshell loaded"
          echo "python --version -> $(python --version)"
          echo ""
        '';
      };
  };
}
