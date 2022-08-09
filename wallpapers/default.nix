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

  prologinCubeMinimal = makeWallpaper {
      src = ./prologin-cube_minimal.png;
      pname = "prologin-cube_minimal";
      version = "v1";
      description = "Wallpaper with the Prologin Cube";
  };

  prolo2020 = makeWallpaper {
      src = ./prolo2020.png;
      pname = "prologin-2020";
      version = "2020";
      description = "Wallpaper of Prologin contest ${version} edition";
  };

  prolo2021 = makeWallpaper {
      src = ./prolo2021.png;
      pname = "prologin-2021";
      version = "2021";
      description = "Wallpaper of Prologin contest ${version} edition";
  };

  prolo2022 = makeWallpaper {
      src = ./prolo2022.png;
      pname = "prologin-2022";
      version = "2022";
      description = "Wallpaper of Prologin contest ${version} edition";
  };
}
