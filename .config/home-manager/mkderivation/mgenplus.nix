{
  lib,
  stdenv,
  fetchurl,
  pkgs,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "mgenplus";
  version = "20150602";

  src = fetchurl {
    url = "https://ftp.iij.ad.jp/pub/osdn.jp/users/8/8597/mgenplus-${finalAttrs.version}.7z";
    hash = "sha256:86f0bcb59516d0b1a791f136d0c1d41ad6d7a10566ceb7fff85cdcedb65b8b8c";
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
    description = "Composite font based on the free M+ OUTLINE FONTS collection";
    homepage = "http://jikasei.me/font/mgenplus";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
  };
})
