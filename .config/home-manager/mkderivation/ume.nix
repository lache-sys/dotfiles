{
  lib,
  stdenv,
  fetchurl,
  pkgs,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "ume";
  version = "670";

  src = fetchurl {
    url = "https://web.archive.org/web/20220212055714/https://free.nchc.org.tw/osdn//ume-font/22212/umefont_${finalAttrs.version}.7z";
    hash = "sha256:92c4e4f40ddb4285f99240fb28fa19808d586cb3aa3fccb348ee9da940ca3e35";
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
    description = "Practical, everyday-use font designed to reduce user stress caused by differences between Office suites.";
    homepage = "https://web.archive.org/web/20250214091915/https://ja.osdn.net/projects/ume-font";
    license = lib.licenses.mplus;
    platforms = lib.platforms.all;
  };
})
