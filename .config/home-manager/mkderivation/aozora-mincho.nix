{
  lib,
  stdenv,
  fetchurl,
  pkgs,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "aozora-mincho";
  version = "0.1";

  src = fetchurl {
    url = "https://web.archive.org/web/20200321102301/http://blueskis.wktk.so/AozoraMincho/archive/v${finalAttrs.version}/aozoramincho-readme-ttf.zip";
    hash = "sha256:343b19f2b5425b2ea080932326875cbd887ab106212ddce246f184672f8d4c17";
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
    description = "Font based on IPA Mincho, available in 7 weights";
    homepage = "https://web.archive.org/web/20200321102301/http://blueskis.wktk.so/AozoraMincho/download.html";
    license = lib.licenses.ipa;
    platforms = lib.platforms.all;
  };
})
