{ lib, pkgs, writeShellApplication, replaceVars, ... }:

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
