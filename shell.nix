with (import <nixpkgs> {}).pkgsi686Linux;

pkgs.mkShell {
  buildInputs = [
    pkgs.nasm
    pkgs.gcc
    pkgs.gcc.libc
    pkgs.gdb
  ];
}
