{ stdenv, lib }:

stdenv.mkDerivation rec {
  pname = "custom-plymouth-theme";
  version = "1";

  src = ./.;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/plymouth/themes/custom-plymouth-theme
    cp -r ./source/* $out/share/plymouth/themes/custom-plymouth-theme/
    find $out/share/plymouth/themes/ -name \*.plymouth -exec sed -i "s@\/usr\/@$out\/@" {} \;
    runHook postInstall
  '';

  meta = with lib; {
    description = "custom plymouth theme";
    platforms = platforms.linux;
  };
}