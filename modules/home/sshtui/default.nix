{ config, lib, pkgs, ... }:
let
  cfg = config.programs.sshtui.sshtui;
in
{
  options.programs.sshtui.sshtui = {
    enable = lib.mkEnableOption "sshtui";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.sshtui;
      description = "sshtui package to use";
    };
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."television/cable/sshtui.toml".source = ../../../sshtui.toml;
    home.packages = [
      cfg.package
    ];
  };
}
