{
  description = "Rust Flake Template";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-22.05";
    #rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url  = "github:numtide/flake-utils";
  };

 outputs = { self, nixpkgs, flake-utils, ... }:
 # outputs = { self, nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        #overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          #inherit system overlays;
          inherit system;
        };
      in
      with pkgs;
      {
        devShells.default = mkShell {
          buildInputs = [
            openssl
            pkg-config
            #(rust-bin.fromRustupToolchainFile ./rust-toolchain)
          ];
        };
      }
    );
}
