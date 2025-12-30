{ pkgs, lib, inputs, namespace, ... }:

# Un check est une dérivation (buildable) — il doit produire un $out.
# On utilise runCommand pour exécuter shellcheck sur le script.
pkgs.runCommand "sshtui-shellcheck" {
  # Outils nécessaires pendant la build
  nativeBuildInputs = [ pkgs.shellcheck ];
  # On passe la source du script à analyser
  src = ../../sshtui;
} ''
  set -euo pipefail
  shellcheck -x -s bash -S style "$src"
  
  mkdir -p "$out"
  echo "Shellcheck passed for sshtui.sh" > "$out/result"
''
