{
  description = "personal website (andresnav.com)";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
    in
    {
      devShells.${system}.default =
        with import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        mkShell {
          packages = [
            gnumake
            mob
            texlive.combined.scheme-full
          ];
        };
    };
}
