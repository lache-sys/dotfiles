{
  lib,
  stdenv,
  fetchFromGitHub,
  nix-update-script,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "x5y8pxnegatape";
  version = "1.000";
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "hicchicc";
    repo = "x5y8pxNegaTape";
    tag = "v${finalAttrs.version}";
    hash = "sha256-EuZ8ciBfkAVtV07n3GTHO+GF2XWC+AEnVJx+YETHusw=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/opentype
    mkdir -p $out/share/fonts/truetype

    install -D -t $out/share/fonts/opentype $src/fonts/otf/x5y8pxNegaTape.otf
    install -D -t $out/share/fonts/truetype $src/fonts/ttf/x5y8pxNegaTape.ttf

    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Negative space pixel font";
    homepage = "https://github.com/hicchicc/x5y8pxNegaTape";
    changelog = "https://github.com/hicchicc/x5y8pxNegaTape/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.ofl;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "x5y8pxnegatape";
    platforms = lib.platforms.all;
  };
})
