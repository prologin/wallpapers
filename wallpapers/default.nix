{ pkgs }:
let
  makeWallpaper =
    {
      src,
      pname,
      version,
      description,
    }:
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
    description = "Wallpaper of Girls Can Code! theme used since ${version}";
  };

  gcc2021vertical = makeWallpaper rec {
    src = ./gcc-witch-black_background.png;
    pname = "gcc-wallpaper-vertical";
    version = "2021";
    description = "Wallpaper of Girls Can Code! theme used since ${version}";
  };

  gcc2021vertical_no-logo = makeWallpaper rec {
    src = ./gcc_witch-black_background-nologo.png;
    pname = "gcc-wallpaper-vertical-no-logo";
    version = "2021";
    description = "Wallpaper of Girls Can Code! theme used since ${version}";
  };

  gccLightDM = makeWallpaper {
    src = ./gcc-lightdm.png;
    pname = "gcc-lightdm";
    version = "v1";
    description = "Background image for LightDM login screen of GCC! images";
  };

  gcc-black-white = makeWallpaper {
    src = ./gcc-black-white.png;
    pname = "gcc-black-white";
    version = "2022";
    description = "Wallpaper with a black background and the GCC! logo in white";
  };

  prologinCubeMinimal = makeWallpaper {
    src = ./prologin-cube_minimal.png;
    pname = "prologin-cube_minimal";
    version = "v1";
    description = "Wallpaper with the Prologin Cube";
  };

  prolo2020 = makeWallpaper rec {
    src = ./prolo2020.png;
    pname = "prologin-2020";
    version = "2020";
    description = "Wallpaper of Prologin contest ${version} edition";
  };

  prolo2021 = makeWallpaper rec {
    src = ./prolo2021.png;
    pname = "prologin-2021";
    version = "2021";
    description = "Wallpaper of Prologin contest ${version} edition";
  };

  prolofinale2021 = makeWallpaper rec {
    src = ./prolofinale2021.png;
    pname = "prolo-finale-2021";
    version = "2021";
    description = "Wallpaper with the logo of the finale of the Prologin contest ${version} edition";
  };

  prolo2022 = makeWallpaper rec {
    src = ./prolo2022.png;
    pname = "prologin-2022";
    version = "2022";
    description = "Wallpaper of Prologin contest ${version} edition";
  };

  prolo2023 = makeWallpaper rec {
    src = ./prolo2023.png;
    pname = "prologin-2023";
    version = "2023";
    description = "Wallpaper of Prologin contest ${version} edition";
  };

  gcc2024 = makeWallpaper rec {
    src = ./gcc2024.png;
    pname = "gcc-wallpaper";
    version = "2024";
    description = "Wallpaper of Girls Can Code! theme used since ${version}";
  };

  prolo2025 = makeWallpaper rec {
    src = ./prolo2025.png;
    pname = "prologin-2025";
    version = "2025";
    description = "Wallpaper of Prologin contest ${version} edition";
  };

  prolo2025_dark = makeWallpaper rec {
    src = ./prolo2025_dark.png;
    pname = "prologin-2025-dark";
    version = "2025";
    description = "Wallpaper of Prologin contest ${version} edition (dark version)";
  };

  prolo2026_16_10 = makeWallpaper rec {
    src = ./prolo2026_16_10.png;
    pname = "prologin-2026_16_10";
    version = "2026";
    description = "Wallpaper of Prologin contest ${version} edition";
  };

  prolo2026_16_9 = makeWallpaper rec {
    src = ./prolo2026_16_9.png;
    pname = "prologin-2026_16_9";
    version = "2026";
    description = "Wallpaper of Prologin contest ${version} edition";
  };
}
