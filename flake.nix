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
        defaultInputs = [ pkgs.fish pkgs.git pkgs.spacevim ];
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

        devShells."c" = mkShell {
          inherit system;

          buildInputs = defaultInputs ++ [ clang cmake ninja ];
          shellHook = defaultCommands;
        };

        devShells."go" = mkShell {
          inherit system;

          buildInputs = defaultInputs ++ [ go ];
          shellHook = defaultCommands;
        };

        devShells."podman" = mkShell {
          inherit system;

          buildInputs = defaultInputs ++ [ podman ];
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

        devShells."tauri" = mkShell {
          inherit system;

          buildInputs = defaultInputs ++ [ rustup rustc cargo cargo-tauri ];

          shellHook = ''
          rustup toolchain add stable
          '' + defaultCommands;
        };

        devShells."veilid" = mkShell {
          inherit system;

          buildInputs = defaultInputs ++ [ rustup rustc cargo capnproto ];

          shellHook = ''
          rustup toolchain add stable
          '' + defaultCommands;
        };

        devShells."zig" = mkShell {
          inherit system;

          buildInputs = defaultInputs ++ [ zig ];

          shellHook = defaultCommands;
        };
      }
    );
}
