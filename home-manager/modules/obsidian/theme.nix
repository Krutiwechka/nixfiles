{ pkgs, ... }:

let
  draculaTheme = pkgs.runCommand "obsidian-theme-dracula" { } ''
    mkdir -p $out
    cp ${pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/dracula/obsidian/master/manifest.json";
      hash = "sha256-gqFg61X4fKEUaSaCCA88RKiw1NGK00CjuyIrCtPK4QE=";
    }} $out/manifest.json
    cp ${pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/dracula/obsidian/master/theme.css";
      hash = "sha256-b1VL1pWiR+H+YPI09TMa3gsTbPh5dc1Qpa99WApMM5Q=";
    }} $out/theme.css
  '';
in
{
  programs.obsidian.defaultSettings.themes = [
    { pkg = draculaTheme; enable = true; }
  ];
}
