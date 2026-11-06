{ inputs, pkgs, ... }:

let
  draculaTheme = pkgs.runCommand "obsidian-theme-dracula" { } ''
    mkdir -p $out
    cp ${inputs.dracula-obsidian}/manifest.json $out/
    cp ${inputs.dracula-obsidian}/theme.css $out/
  '';
in
{
  programs.obsidian.defaultSettings.themes = [
    { pkg = draculaTheme; enable = true; }
  ];
}
