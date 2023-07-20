{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    devShells.x86_64-linux.default = pkgs.mkShell {
      name = "ElectoMonad";
      buildInputs = [
        (pkgs.ghc.withPackages (ps: with ps; [ cabal-install ]))
      ];
    };
  };
}
