{
  lib,
  stdenv,
  fetchurl,
  pkgs,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "rounded-x-mgenplus";
  version = "20150602";

  src = fetchurl {
    url = "https://ftp.iij.ad.jp/pub/osdn.jp/users/8/8599/rounded-x-mgenplus-${finalAttrs.version}.7z";
    hash = "sha256:c60427a75033fcc2f9ee5645df7edcf4c3d91519d968600b8315c5f6a4e5025d";
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
