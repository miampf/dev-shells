# dev-shells

Just some development environments/shells I wrote to learn more about nix. Could be useful to get a somewhat nice deveolpment environment up anywhere with just one command.

## Using the shells

Using the shells is a simple `nix develop github:miampf/dev-shells#<name>`. Different names and a description for them is provided in a table below. Also, all environments come with `git`, `spacevim` and the `fish`-shell.


| <name>       | description                                                                          |
|--------------|--------------------------------------------------------------------------------------|
| bun          | Installs the [bun](https://bun.sh/) program to work with javascript.                 |
| c            | Installs clang, clang++, cmake and ninja                                             |
| go           | Installs the go runtime.                                                             |
| podman       | Installs podman for containerization.                                                |
| rust-nightly | Installs rust with the nightly toolchain.                                            |
| rust-stable  | Installs rust with the stable toolchain.                                             |
| tauri        | Installs rust (stable) and cargo-tauri.                                              |
| veilid       | Installs rust and veilid requirements needed to work to develop veilid apps in rust. |
| zig          | Installs zig                                                                         |
