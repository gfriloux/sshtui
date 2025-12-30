{
    pkgs,
    mkShell,
    ...
}:

mkShell {
  # Create your shell
  packages = with pkgs; [
    bashInteractive
    fzf
    rbw
    bat
    gawk
    shellcheck
  ];
}
