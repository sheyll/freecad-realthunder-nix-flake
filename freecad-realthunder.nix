{ runCommand, makeWrapper, freecad, py_slvs }:

runCommand "freecad-realthunder"
{
  buildInputs = [ makeWrapper ];
  propagatedBuildInputs = [ freecad py_slvs ];
} ''
  mkdir -p $out/bin/
  makeWrapper  \
     ${freecad}/bin/freecad \
     $out/bin/freecad-realthunder \
     --prefix PYTHONPATH : ${py_slvs}
''
