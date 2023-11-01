{ python3Packages, fetchurl, fetchzip, stdenv, autoPatchelfHook }:
stdenv.mkDerivation rec {
  pname = "py_slvs";
  version = "1.0.3";
  src =
    fetchzip {
      url = "https://files.pythonhosted.org/packages/e9/e7/b430db28f0917f814d42c32272b67da923839a80900ae3fa1d6b6d754321/py_slvs-1.0.3-cp310-cp310-manylinux_2_17_x86_64.manylinux2014_x86_64.whl";
      sha256 = "sha256-j1QWQFghw+MD2ibzkX4hT4eRp/OenYU8I+U5S1z7gik=";
      extension = "zip";
      stripRoot = false;
    };


  doCheck = false;
  buildInputs = [ stdenv.cc.cc.lib ];
  nativeBuildInputs = [ autoPatchelfHook ];
  propagatedBuildInputs = [ python3Packages.setuptools ];
  buildPhase = ''
    '';
  installPhase = ''
    mkdir -p $out/
    cp -Rv py_slvs $out/
    cp -v py_slvs/*.so $out/

  '';
}

