{
  lib,
  stdenv,
  fetchurl,
  pkgs,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "kh-dot";
  version = "20150527";

  src = fetchurl {
    url = "https://ftp.iij.ad.jp/pub/osdn.jp/users/8/8545/khdotfont-${finalAttrs.version}.7z";
    hash = "sha256:37e07933056c0d5882924cb4cfea0989532dfa0436d7b840025443e7f7e16032";
  };

  nativeBuildInputs = [
    pkgs._7zz
  ];

  buildInputs = [
    pkgs.installFonts
  ];

  dontFixup = true;

  unpackPhase = ''
    runHook preUnpack
    7zz x $src
    runHook postUnpack
  '';

  meta = {
    description = "Expressive 15 bitmap fonts";
    homepage = "http://jikasei.me/font/kh-dotfont";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
  };
})
