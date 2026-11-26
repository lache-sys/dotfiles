{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkgs,
  stdenv,
  nix-update-script,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "ntsc-rs";
  version = "0.9.7";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "ntsc-rs";
    repo = "ntsc-rs";
    tag = "v${finalAttrs.version}";
    hash = "sha256-av91Iile7GsTbWRnmGyZrNHPx6IvNl3vK054l5yRhwE=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-tEC0W8A+vSMjqfL34vRHFhmd/IvvGvpa3WmSG0mBJdA=";

  nativeBuildInputs = [
    pkgs.pkg-config
    rustPlatform.bindgenHook
  ];

  buildInputs = [
    pkgs.fontconfig
    pkgs.glib
    pkgs.gst_all_1.gst-plugins-base
    pkgs.gst_all_1.gstreamer
    pkgs.libwebp
    pkgs.libxkbcommon
    pkgs.openssl
    pkgs.vulkan-loader
  ]
  ++ lib.optionals stdenv.hostPlatform.isLinux [
    pkgs.wayland
  ];

  patchPhase = ''
    substituteInPlace Cargo.toml --replace-fail "members = [\"crates/*\", \"xtask\"]" "members = [\"crates/gui\", \"crates/ntscrs\", \"xtask\"]"
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Free, open-source VHS effect";
    homepage = "https://github.com/ntsc-rs/ntsc-rs";
    changelog = "https://github.com/ntsc-rs/ntsc-rs/releases/tag/${finalAttrs.src.tag}";
    license = with lib.licenses; [
      isc
      mit
      tost
    ];
    maintainers = with lib.maintainers; [ ];
    mainProgram = "ntsc-rs";
  };
})
