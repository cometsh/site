{
  lib,
  stdenv,
  nodejs,
  pnpm,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "comet-site";
  version = "1.0.0";
  src = lib.cleanSource ./.;

  nativeBuildInputs = [nodejs pnpm.configHook];

  pnpmDeps = pnpm.fetchDeps {
    inherit (finalAttrs) pname version src;
    hash = "sha256-gFTKyJ0ocHMSf3mdDaqkBl6cuo0DmCW8/49/GYZKNKw=";
  };

  buildPhase = ''
    runHook preBuild

    pnpm build

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    cp -r dist $out

    runHook postInstall
  '';
})
