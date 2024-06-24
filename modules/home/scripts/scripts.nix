{pkgs, ...}: let
  compress = pkgs.writeScriptBin "compress" (builtins.readFile ./scripts/compress.sh);
  extract = pkgs.writeScriptBin "extract" (builtins.readFile ./scripts/extract.sh);
  ascii = pkgs.writeScriptBin "ascii" (builtins.readFile ./scripts/ascii.sh);
  cfg = pkgs.writeScriptBin "cfg" (builtins.readFile ./scripts/cfg.sh);
  bless = pkgs.writeScriptBin "bless" (builtins.readFile ./scripts/bless.sh);
  colortable = pkgs.writeScriptBin "colortable" (builtins.readFile ./scripts/colortable.sh);
  clone = pkgs.writeScriptBin "clone" (builtins.readFile ./scripts/clone.sh);
in {
  home.packages = with pkgs; [
    compress
    extract
    ascii
    cfg
    bless
    colortable
    clone
  ];
}
