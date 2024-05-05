{
  pkgs,
  config,
  ...
}: {
  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
    "wasm32-wasi"
    "x86_64-windows"
    "riscv32-linux"
    "riscv64-linux"
  ];
}
