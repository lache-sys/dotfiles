{
  lib,
  stdenv,
  fetchFromGitHub,
  pkgs,
  nix-update-script,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "ymfm";
  version = "0-unstable-2026-07-27";
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "aaronsgiles";
    repo = "ymfm";
    rev = "81aec25ccbb98f4873a255f7551ac4dadac59b4a";
    hash = "sha256-rh2xDl8Y8QNDrntM0hpD3UZu0J4MkTFiqG/UW9loH8I=";
  };

  nativeBuildInputs = [
    pkgs.clang
  ];

  buildPhase = ''
    echo $PWD
    clang++ --std=c++14 -I$src/src $src/examples/buildall/buildall.cpp $src/src/ymfm_misc.cpp $src/src/ymfm_opl.cpp $src/src/ymfm_opm.cpp $src/src/ymfm_opn.cpp $src/src/ymfm_opq.cpp $src/src/ymfm_opz.cpp $src/src/ymfm_adpcm.cpp $src/src/ymfm_pcm.cpp $src/src/ymfm_ssg.cpp -o buildall
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -pr buildall $out/bin
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "BSD-licensed Yamaha FM sound cores (OPM, OPN, OPL, and others";
    homepage = "https://github.com/aaronsgiles/ymfm";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "ymfm";
    platforms = lib.platforms.all;
  };
})
