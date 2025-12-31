{ lib, pkgs, writeShellApplication, ... }:

writeShellApplication {
  name = "sshtui";
  text = (builtins.readFile ../../sshtui);
  runtimeInputs = with pkgs; [
    bash
    television
    bat
    gawk
  ];
}
