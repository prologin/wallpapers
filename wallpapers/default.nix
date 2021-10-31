{ pkgs }:
let
  makeWallpaper = { src, pname, version, description }:
    pkgs.stdenvNoCC.mkDerivation {
      inherit pname src version;

      dontUnpack = true;

      installPhase = ''
        mkdir -p $out
        cp $src $out/${builtins.baseNameOf src}
      '';

      meta = with pkgs.lib; {
        inherit description;
        platforms = platforms.all;
      };
    };
in
{
  gcc2021 = makeWallpaper rec {
    src = ./gcc2021.jpg;
    pname = "gcc-wallpaper";
    version = "2021";
    description = "Wallpaper for the ${version} edition of Girls Can Code!";
  };

  gccLightDM = makeWallpaper {
    src = ./gcc-lightdm.png;
    pname = "gcc-lightdm";
    version = "v1";
    description = "Background image for LightDM login screen of GCC! images";
  };
}
