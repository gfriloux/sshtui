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

  meta  = with lib; {
    description = "Simple SSH TUI";
    licence = licences.gpl;
    platforms = platforms.all;
    mainProgram = "sshtui";
  };
}
