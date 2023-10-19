{
  description = "Some shells for developing in specific environments.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = (import nixpkgs) {
          inherit system;
        };
        defaultInputs = [ pkgs.fish pkgs.git ];
        defaultCommands = ''
        echo "Time to mix drinks and change lives!"
        fish
        '';


      in 
      with pkgs;
      {
        devShells."bun" = mkShell {
          inherit system;

          buildInputs = defaultInputs ++ [ bun ];
          shellHook = defaultCommands;
        };

        devShells."rust-nightly" = mkShell {
          inherit system;

          buildInputs = defaultInputs ++ [ rustup rustc cargo ];

          shellHook = ''
          rustup toolchain add nightly
          '' + defaultCommands;
        };

        devShells."rust-stable" = mkShell {
          inherit system;
          
          buildInputs = defaultInputs ++ [ rustup rustc cargo ];

          shellHook = ''
          rustup toolchain add stable
          '' + defaultCommands;
        };
      }
    );
}
