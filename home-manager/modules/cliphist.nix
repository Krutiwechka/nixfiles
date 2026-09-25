{ pkgs, ... }:
{
  home.packages = [ pkgs.cliphist pkgs.wl-clipboard ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "wl-paste --watch cliphist store"
  ];
  wayland.windowManager.hyprland.settings.bind = [
    "$mod, V, exec, ${pkgs.cliphist}/bin/cliphist list | ${pkgs.rofi}/bin/rofi -dmenu -p clipboard | ${pkgs.cliphist}/bin/cliphist decode | ${pkgs.wl-clipboard}/bin/wl-copy"
  ];
}

