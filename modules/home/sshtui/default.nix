
{ inputs, config, lib, pkgs, namespace, ... }:
let
  cfg = config.programs.sshtui;
  # On embarque le fichier fourni par le dépôt ; le chemin est relatif à ce module
  bundledFile = ../../../sshtui.toml;
  #bundledScript = ../../../sshtui.sh;
  
  sshtui = (inputs.self.packages.${pkgs.system}.sshtui or (pkgs.sshtui or null));
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
