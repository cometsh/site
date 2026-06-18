{
  lib,
  stdenv,
  nodejs,
  pnpm,
  fetchPnpmDeps,
  pnpmConfigHook,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "comet-site";
  version = "1.0.0";
  src = lib.cleanSource ./.;

  nativeBuildInputs = [nodejs pnpm pnpmConfigHook];

  pnpmDeps = fetchPnpmDeps {
    inherit (finalAttrs) pname version src;
    hash = "sha256-49SERVweWfu4IJ0QBCuys1FmH0VF864c3pywQrdGShI=";
    fetcherVersion = 3;
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
