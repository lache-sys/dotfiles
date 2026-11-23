{
  lib,
  stdenv,
  fetchurl,
  pkgs,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "corporate-logo-rounded";
  version = "3";

  src = fetchurl {
    url = "https://logotype.jp/wp-content/uploads/2022/10/Corporate-Logo-Rounded-Bold-ver${finalAttrs.version}.zip";
    hash = "sha256:8146e09adb21515cddd9c1f783c91fb029480844bcbdcf051a3d6ac35b99751d";
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
    description = "Corporate Logo (Rounded) ver. 3";
    homepage = "https://logotype.jp/font-corpmaru.html";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
  };
})
