{
  description = "A Nix-flake-based OI environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self , nixpkgs, ... }: let
    system = "x86_64-linux";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
    in pkgs.mkShell {
      packages = with pkgs; [
        gcc
        gdb
      ];

      buildInputs = with pkgs; [
        gcc
        glibc.static
      ];
    };
  };
}
