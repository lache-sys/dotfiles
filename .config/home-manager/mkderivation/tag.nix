{
  lib,
  stdenv,
  fetchFromGitHub,
  pkgs,
  nix-update-script,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "tag";
  version = "0.10";
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "jdberry";
    repo = "tag";
    tag = "v${finalAttrs.version}";
    hash = "sha256-nWdhlH9kzGVQz06phSv00dqw4Nydf5RHX83YXCOS5SU=";
  };

  nativeBuildInputs = [
  ];

  buildInputs = [
    pkgs.clang
    pkgs.coreutils
    pkgs.gnumake
    pkgs.openssl
  ];

  patchPhase = ''
    substituteInPlace Makefile --replace-fail "prefix		= /usr/local" "prefix 		= $out"
    substituteInPlace Makefile --replace-fail "INSTALL		= /usr/bin/install" "INSTALL 		= ${pkgs.coreutils}/bin/install"
  '';

  buildPhase = ''
  '';

  installPhase = ''
    make DESTDIR=$out/bin
    make DESTDIR=$out/bin install
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "A command line tool to manipulate tags on Mac OS X files, and to query for files with those tags";
    homepage = "https://github.com/jdberry/tag";
    changelog = "https://github.com/jdberry/tag/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "tag";
    platforms = lib.platforms.darwin;
  };
})
