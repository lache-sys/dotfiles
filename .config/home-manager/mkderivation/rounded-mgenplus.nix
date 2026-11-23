{
  lib,
  stdenv,
  fetchurl,
  pkgs,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "rounded-mgenplus";
  version = "20150602";

  src = fetchurl {
    url = "https://ftp.iij.ad.jp/pub/osdn.jp/users/8/8598/rounded-mgenplus-${finalAttrs.version}.7z";
    hash = "sha256:ecea6764973d93936238f1c06ed246310bec320f63f350c2bdb7e8d1feee25cc";
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
