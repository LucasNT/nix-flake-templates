{
  description = "Trivial Template";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05"; };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nativeBuildInputs = with pkgs; [ ];
      developmentPakcages = with pkgs; [ ];
      extraPackages = with pkgs; [ bashInteractive ];
    in {

      packages.${system}.default = { };

      devShells.${system}.default = pkgs.mkShellNoCC {
        packages = nativeBuildInputs ++ developmentPakcages ++ extraPackages;
      };
    };
}
