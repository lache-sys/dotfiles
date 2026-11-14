{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  wrapGAppsHook3,
  atk,
  aws-lc,
  bzip2,
  cairo,
  cmake,
  fontconfig,
  gdk-pixbuf,
  glib,
  gtk3,
  libxkbcommon,
  mame,
  pango,
  vulkan-loader,
  xz,
  zstd,
  stdenv,
  alsa-lib,
  wayland,
  nix-update-script,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "rusty-backup";
  version = "2026-11-11-23-10";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "danifunker";
    repo = "rusty-backup";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Dn95HOQnFN7UatvZPtl4chkIXxcs3buAI7zNwC3b9lc=";
  };

  cargoHash = "sha256-kTeJ3ksU8SGyXvHPk0MOUv3lVhWXuO4Dy9qqqS+Tu0M=";

  nativeBuildInputs = [
    cmake
    mame
    pkg-config
    wrapGAppsHook3
  ];

  buildInputs = [
    atk
    aws-lc
    bzip2
    cairo
    fontconfig
    gdk-pixbuf
    glib
    gtk3
    libxkbcommon
    pango
    vulkan-loader
    xz
    zstd
  ]
  ++ lib.optionals stdenv.hostPlatform.isLinux [
    alsa-lib
    wayland
  ];

  env = {
    LIBCHDMAN_FORCE_SOURCE = true;
    ZSTD_SYS_USE_PKG_CONFIG = true;
  };

  cargoBuildFlags = [
    "--features"
    "gui"
  ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Backup your vintage computer hard disks using your modern one";
    homepage = "https://github.com/danifunker/rusty-backup";
    changelog = "https://github.com/danifunker/rusty-backup/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "rusty-backup";
  };
})
