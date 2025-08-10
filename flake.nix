{
  inputs = {
    utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    utils,
  }:
    utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.default = pkgs.stdenv.mkDerivation {
          src = ./.;
          name = "buuf-icon-theme";
          # buildPhase = "elided";
          installPhase = ''
            mkdir -p $out/share/icons/buuf-icon-theme
            cp -r . $out/share/icons/buuf-icon-theme
          '';
        };
      }
    );
}
