{
  lib,
  stdenv,
  fetchFromGitHub,
  pkgs,
  nix-update-script,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "np2kai";
  version = "0-unstable-2026-09-05";
  __structuredAttrs = true;
  strictDeps = true;

  src = fetchFromGitHub {
    owner = "AZO234";
    repo = "NP2kai";
    rev = "fbd196ecaced0b05f27042eb1dd786a5e8cade47";
    hash = "sha256-g1BYww0PqFfZfNWLPtenKx0mtxoehOKrAxmAt7Xw8X0=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    pkgs.cmake
    pkgs.gcc
    pkgs.git
    pkgs.gnumake
    pkgs.libusb1
    pkgs.ninja
    pkgs.pkg-config
    pkgs.SDL
    pkgs.SDL_mixer
    pkgs.SDL_ttf
    pkgs.SDL2
    pkgs.SDL2_mixer
    pkgs.SDL2_ttf
    pkgs.wxwidgets_3_3
  ];

  buildInputs = [
    pkgs.libcdio
    pkgs.libpng
    pkgs.sdl3
    pkgs.sdl3-ttf
    pkgs.zlib
  ];

  env = {
  };

  configurePhase = ''
  '';

  preBuild = ''
    mkdir build
    cmake . -B build -D BUILD_SDL=ON
  '';

  buildPhase = ''
    make -j
  '';

  installPhase = ''
    make install
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Neko Project II kai";
    homepage = "https://github.com/AZO234/NP2kai";
    license = with lib.licenses; [
      zlib
      mit
    ];
    maintainers = with lib.maintainers; [ ];
    mainProgram = "np2kai";
    platforms = lib.platforms.all;
  };
})
