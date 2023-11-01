final: prev: {
  py_slvs = final.callPackage ./bin-py-slvs.nix { };
  freecad-realthunder = final.callPackage ./freecad-realthunder.nix { };
}
