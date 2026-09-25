{ pkgs, lib, ... }:
{
    home.packages = [ pkgs.cliphist pkgs.wl-clipboard ];

  systemd.user.services.cliphist = {
    Unit = {
      Description = "cliphist clipboard history daemon";
      After = [ "hyprland-session.target" ];
      PartOf = [ "hyprland-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "hyprland-session.target" ];
  };

  systemd.user.services.cliphist-image = {
    Unit = {
      Description = "cliphist image clipboard history daemon";
      After = [ "hyprland-session.target" ];
      PartOf = [ "hyprland-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "hyprland-session.target" ];
  };
    wayland.windowManager.hyprland.settings.bind = [
      { _args = [ "SUPER + V" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"sh -c \\\"cliphist list | rofi -dmenu -p clipboard | cliphist decode | wl-copy\\\"\")") ]; }
  { _args = [ "SUPER + SHIFT + V" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"cliphist wipe\")") ]; }  ];
}

