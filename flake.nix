{
  description = "The patched version of FreeCAD with the realthunder assembly plugin";

  outputs = { self, nixpkgs }:
    let
      p = (import nixpkgs {
        system = "x86_64-linux";
        overlays = [ (import ./overlay.nix) ];
      });
    in
    {
      overlay = import ./overlay.nix;
      
      packages.x86_64-linux = {
        inherit (p) py_slvs freecad-realthunder;
      };

      defaultPackage.x86_64-linux =
        self.packages.x86_64-linux.freecad-realthunder;

    };
}
