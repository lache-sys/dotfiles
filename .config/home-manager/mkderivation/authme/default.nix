{
  lib,
  stdenv,
  fetchFromGitHub,
  pkgs,
  nix-update-script,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "authme";
  version = "7.1.2";
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "levminer";
    repo = "authme";
    tag = finalAttrs.version;
    hash = "sha256-G0HXm0JIlWYQPCuWmeek7Lc90b1c8CcUFxF6eTlqFcw=";
  };

  cargoRoot = "core";

  cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) cargoRoot src;
    hash = "sha256-vc5sGYSWNRnYo6d38B3OmvHHD/qpFIMpVQHmFQJx7ek=";
  };

  nativeBuildInputs = [
    pkgs.actool
    pkgs.apple-sdk_26
    pkgs.cargo
    pkgs.cargo-tauri
    pkgs.cacert
    pkgs.nodejs_26
    pkgs.openssl
    pkgs.pkg-config
    pkgs.swift
    pkgs.swiftPackages.swiftpm
    pkgs.rustc
    pkgs.rustPlatform.cargoSetupHook
    pkgs.xcbuild
  ];

  buildInputs = [
  ];

  env = {
    TAURI_SIGNING_PRIVATE_KEY = "";
    TAURI_SIGNING_PRIVATE_KEY_PASSWORD = "";
  };

  patches = [
    ./patches/tauri_cfg.patch
  ];

  dontFixup = false;
  dontStrip = false;

  preBuild = ''
    export HOME="$TMPDIR"
    export npm_config_cache="$TMPDIR/.npm"
    actool $src/core/icons/icon.icns \
      --compile ./core/car \
      --output-format human-readable-text \
      --notices --warnings \
      --output-partial-info-plist ./icons/out/assetcatalog_generated_info.plist \
      --app-icon Icon \
      --include-all-app-icons \
      --accent-color AccentColor \
      --enable-on-demand-resources NO \
      --development-region en \
      --target-device mac \
      --minimum-deployment-target 26.0 \
      --platform macosx
    npm install
    npm run build
  '';

  buildPhase = ''
    runHook preBuild
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    runHook postInstall
  '';

  postInstall = ''
  ''
  + (
    if stdenv.hostPlatform.isDarwin then
      ''
        mkdir -p $out/Applications
        cp -pr core/target/release/bundle/macos/Authme.app $out/Applications
      ''
    else
      ''
      ''
  )
  + ''
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Simple cross-platform two-factor (2FA) authenticator app for desktop";
    homepage = "https://github.com/levminer/authme";
    changelog = "https://github.com/levminer/authme/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "authme";
    platforms = lib.platforms.all;
  };
})
