{
  lib,
  stdenv,
  fetchFromGitHub,
  nix-update-script,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "x8y12pxdenkichip";
  version = "1.100";
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "hicchicc";
    repo = "x8y12pxDenkiChip";
    tag = "v${finalAttrs.version}";
    hash = "sha256-EC5yH4JHbw9M6MJlXnrCiYd44ol+2P11tBlQUPIWpmg=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype
    install -D -t $out/share/fonts/truetype $src/fonts/ttf/x8y12pxDenkiChip.ttf

    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "DenkiChip (でんきチップ) is a compact and bold Japanese pixel font under SIL OFL 1.1";
    homepage = "https://github.com/hicchicc/x8y12pxDenkiChip";
    changelog = "https://github.com/hicchicc/x8y12pxDenkiChip/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.ofl;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "x8y12pxdenkichip";
    platforms = lib.platforms.all;
  };
})
