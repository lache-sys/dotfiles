{
  lib,
  stdenv,
  fetchFromGitHub,
  pkgs,
  nix-update-script,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "tiny5";
  version = "2.007";
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "gissio";
    repo = "font_tiny5";
    tag = finalAttrs.version;
    hash = "sha256-v6fy9gMK0oc5j6ZO6YXPeSP4mMdxwI4JJ7XVS1u9oms=";
  };

  nativeBuildInputs = [
    pkgs.python315
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/opentype
    mkdir -p $out/share/fonts/truetype

    install -D -t $out/share/fonts/opentype $src/fonts/otf/*.otf
    install -D -t $out/share/fonts/truetype $src/fonts/ttf/*.ttf
    install -D -t $out/share/fonts/truetype $src/fonts/variable/*.ttf

    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "A 5-pixel variable font that captures the essence of 1980s–90s digital minimalism";
    homepage = "https://github.com/gissio/font_tiny5";
    changelog = "https://github.com/gissio/font_tiny5/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.ofl;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "tiny5";
    platforms = lib.platforms.all;
  };
})
