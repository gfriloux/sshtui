{ config, lib, pkgs, ... }:
let
  cfg = config.programs.sshtui;
  bundledFile = ../../../sshtui.toml;
in
{
  options.programs.sshtui = {
    enable = lib.mkEnableOption "sshtui";

    source = lib.mkOption {
      type = lib.types.path;
      default = bundledFile;
      description = ''
        Chemin vers le fichier sshtui.toml à installer.
        Par défaut, utilise celui fourni par ce dépôt.
      '';
    };

    targetPath = lib.mkOption {
      type = lib.types.str;
      default = ".config/television/cable/sshtui.toml";
      description = "Chemin relatif à $HOME où installer le fichier.";
    };
  };

  config = lib.mkIf cfg.enable {
    home.file.${cfg.targetPath}.source = cfg.source;
  };
}
