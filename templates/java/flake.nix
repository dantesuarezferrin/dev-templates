{
  description = "Java devshell with JDK21 + Maven + Gradle";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux"; # tu notebook
    pkgs = import nixpkgs { inherit system; };
  in
  {
    devShells.${system}.default = pkgs.mkShell {

      packages = with pkgs; [
        jdk21
        maven
        gradle
      ];

      shellHook = ''
        echo "☕ Java dev environment listo"
        java -version
      '';
    };
  };
}
