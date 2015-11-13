{ mkDerivation, base, data-default-class, reflex, stdenv }:
mkDerivation {
  pname = "hammer";
  version = "0.1";
  src = ./.;
  libraryHaskellDepends = [ base data-default-class reflex ];
  homepage = "https://github.com/mightybyte/hammer";
  description = "Reflex hammer";
  license = stdenv.lib.licenses.gpl3;
}
