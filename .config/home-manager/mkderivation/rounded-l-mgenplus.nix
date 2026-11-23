{
  lib,
  stdenv,
  fetchurl,
  pkgs,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "rounded-l-mgenplus";
  version = "20150602";

  src = fetchurl {
    url = "https://ftp.iij.ad.jp/pub/osdn.jp/users/8/8600/rounded-l-mgenplus-${finalAttrs.version}.7z";
    hash = "sha256:85337fad1e115cfb7d45fcd6312ebc69536b3e891e7cd079e23a8c4f8621d1ef";
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
    description = "Rounded font based on the free ROUNDED M+ FONTS collection";
    homepage = "http://jikasei.me/font/rounded-mgenplus";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
  };
})
