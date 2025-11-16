{
  description = "Golang Template";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05"; };

  outputs = { self, nixpkgs }:
    let
      # define system once
      system = "x86_64-linux";
      # use it here, and bind platform-specific packages to `pkgs`
      pkgs = nixpkgs.legacyPackages.${system};
      nativeBuildInputs = with pkgs; [ go ];
      extraPackages = with pkgs; [ gopls delve ];
    in {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = nativeBuildInputs;
        packages = nixpkgs.lib.mkMerge [ extraPackages [ bashInteractive ] ];
      };
    };
}
