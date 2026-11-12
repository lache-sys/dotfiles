{
  lib,
  stdenv,
  fetchFromGitHub,
  nix-update-script,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "x5y8pxnegaclip";
  version = "1.000";
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "hicchicc";
    repo = "x5y8pxNegaClip";
    tag = "v${finalAttrs.version}";
    hash = "sha256-p1Naah/yFBusXt4NoqxsmJRDrfpCBRVM54amPLRjokg=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/opentype
    mkdir -p $out/share/fonts/truetype

    install -D -t $out/share/fonts/opentype $src/fonts/otf/x5y8pxNegaClip.otf
    install -D -t $out/share/fonts/truetype $src/fonts/ttf/x5y8pxNegaClip.ttf

    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Overlapping outline pixel font";
    homepage = "https://github.com/hicchicc/x5y8pxNegaClip";
    changelog = "https://github.com/hicchicc/x5y8pxNegaClip/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.ofl;
    maintainers = with lib.maintainers; [ ];
    platforms = lib.platforms.all;
  };
})
