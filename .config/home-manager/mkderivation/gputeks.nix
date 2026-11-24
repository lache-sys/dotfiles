{
  lib,
  stdenv,
  fetchurl,
  pkgs,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "gputeks";
  version = "0.9";

  src = fetchurl {
    url = "https://www.glukfonts.pl/fontdl/f231212/font/gputeks/Gputeks-${finalAttrs.version}.zip";
    hash = "sha256:d8ac1f959a002ccfd05a2efa06984aabd1e217ebe833a6f2f413cb6b6cfcf0d3";
  };

  nativeBuildInputs = [
    pkgs.unar
  ];

  buildInputs = [
    pkgs.installFonts
  ];

  dontFixup = true;

  unpackPhase = ''
    runHook preUnpack
    unar $src
    runHook postUnpack
  '';

  meta = {
    description = "Geometric Font in .ttf format";
    homepage = "https://www.glukfonts.pl/font.php?font=Gputeks";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
  };
})
