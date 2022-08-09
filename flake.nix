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
        inherit (nixpkgs) lib;
        pkgs = import nixpkgs { inherit system; };
        wallpapers = import ./wallpapers { inherit pkgs; };
      in
      {
        packages = wallpapers;
        apps.listPkgs = {
          type = "app";
          program = toString (pkgs.writeShellScript "list.sh" (lib.concatMapStringsSep "\n" (el: "echo '${el}'") (builtins.attrNames self.packages.${system})));
        };
      }
    );
}
