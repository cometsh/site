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
    hash = "sha256-+hbFaY96gnQ8xPIecP9qlpmTDn9jgY/l9mNVWTvXhtg=";
    fetcherVersion = 4;
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
