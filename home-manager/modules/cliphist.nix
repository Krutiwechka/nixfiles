{ pkgs, lib, ... }:
{
  home.packages = [ pkgs.wl-clipboard ];

  services.cliphist = {
    enable = true;
    allowImages = true;
  };

  wayland.windowManager.hyprland.settings.bind = [
    {
      _args = [
        "SUPER + V"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"sh -c \\\"cliphist list | rofi -dmenu -p clipboard | cliphist decode | wl-copy\\\"\")")
      ];
    }
    {
      _args = [
        "SUPER + SHIFT + V"
        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"cliphist wipe\")")
      ];
    }
  ];
}
