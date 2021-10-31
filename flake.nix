{
  description = "Prologin wallpapers as Nix packages";

  inputs = {
    futils.url = "github:numtide/flake-utils";
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixpkgs-unstable";
    };
  };

  outputs = { self, futils, nixpkgs }:
    futils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        wallpapers = import ./wallpapers { inherit pkgs; };
      in
      {
        packages = wallpapers;
      }
    );
}
