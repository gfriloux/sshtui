{
  lib,
  inputs,
  namespace,
  pkgs,
  stdenv,
  ...
}:

stdenv.mkDerivation rec {
  name = "sshtui";
  src = ../../sshtui;
  buildInputs = with pkgs; [ bash television bat gawk ];
  nativeBuildInputs = with pkgs; [ makeWrapper ];

  unpackCmd = ''
    # $curSrc is the variable that contains the path to our source.
    mkdir test-src
    
    # We rename the file here, because when nix adds files to the
    # store it adds a hash, which obviously we don't want for our
    # shell script.
    cp $curSrc test-src/sshtui
  '';
  
  ## Installation
  installPhase = ''
    # Before we wrap it, we need to actually install our script.
    #
    # For reference, -D creates leading directories, and m755 makes
    # it root-read-write-exec, all other users read-exec. This is
    # pretty standard for binaries, because this allows root to
    # easily delete the file if need-be.
    #
    # In practice, on NixOS, the file will be read-only for all
    # users, but it's the thought that counts.
    #
    # See also `man install`
    #
    install -Dm755 sshtui $out/bin/sshtui
    
    # This is where we create the wrapping script that sets PATH.
    #
    # Note the single quotes around our makeBinPath - after all, this
    # is just an argument to a binary executed by bash. While nix
    # paths can technically never result in splitting, this makes it
    # very explicit that we're putting something in bash args that may
    # need escaping otherwise.
    #
    # See also https://nixos.org/manual/nixpkgs/stable/#fun-wrapProgram
    #
    wrapProgram $out/bin/sshtui --prefix PATH : '${pkgs.lib.makeBinPath buildInputs}'
  '';
}
