{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [ pkgs.nasm pkgs.gcc pkgs.gdb ];
}
