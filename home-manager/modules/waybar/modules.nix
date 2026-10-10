{pkgs, ...}:

{
programs.waybar.settings = {
  mainBar = {
    "hyprland/workspaces" = {
      format = "{icon}";
      format-icons = {
        active = "󰅁󰨐󰅂";
        default = "󰨐";
        empty = "󱓜";
      };
      "persistent-workspaces" = {
        "*" = 5;
      };
    };

    "clock" = {
      "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      "format-alt" = "{:%Y-%m-%d}";
    };

    "backlight" = {
      format = "{icon} {percent}%";
      "format-icons" = [
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
      ];
      "scroll-step" = 1;
    };

    "battery" = {
      states = {
        good = 95;
        warning = 30;
        critical = 15;
      };
      format = "{icon} {capacity}%";
      format-full = "{icon} {capacity}%";
      format-charging = "󰂄 {capacity}%";
      format-plugged = " {capacity}%";
      format-icons = [ "" "" "" "" "" ];
    };

#    "power-profiles-daemon" = {
#      format = "{icon}";
#      tooltip-format = "Power profile: {profile}\nDriver: {driver}";
#      tooltip = true;
#      format-icons = {
#        default = "";
#        performance = "";
#        balanced = "";
#        power-saver = "";
#      };
#    };

    "network" = {
      format-wifi = " {essid} ({signalStrength}%)";
      format-ethernet = "{ipaddr}/{cidr} 󰈀";
      tooltip-format = "{ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP) ";
      format-disconnected = "Disconnected 󰱟";
      on-click = "${pkgs.networkmanager_dmenu}/bin/networkmanager_dmenu";
    };

    "pulseaudio" = {
      scroll-step = 1;
      format = "{icon} {volume}% ";
      format-bluetooth = "{icon} {volume}%";
      format-bluetooth-muted = "󰝟 {icon}";
      format-muted = "󰝟";
      format-icons = {
        headphone = "";
        hands-free = "";
        headset = "";
        phone = "";
        portable = "";
        car = "";
        default = [ "" "" "" ];
      };
      on-click = "pavucontrol";
    };

    "cpu" = {
      format = "󰍛 {usage}% ";
      on-scroll-up = true;
      on-scroll-down = true;
    };

    "memory" = {
      format = " {}% ";
      on-scroll-up = true;
      on-scroll-down = true;
    };

    "disk" = {
      interval = 30;
      format = "󰗮 {percentage_used}% ";
      path = "/";
    };

    "tray" = {
      icon-size = 16;
      spacing = 0;
      show-passive-icons = true;
    };

    "hyprland/window" = {
      format = "{}";
      max-length = 60;
    };

    "custom/divider1" = {
      format = "";
    };

    "custom/divider2" = {
      format = "";
    };

    "custom/divider3" = {
      format = "";
    };
  };
};
}
