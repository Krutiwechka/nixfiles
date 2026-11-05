{
	programs.waybar= {
		enable = true;
		systemd.enable = true;
		style = ./style.css;
		settings.mainBar = {
			layer = "top";
			position = "top";
			height = 32;
			spacing = 0;
			modules-left = [
				"hyprland/workspaces"
				"mpris"
			];
			modules-center = [
				"group/info"
			];
			modules-right = [
				"custom/divider3"
    			"network"
    			"custom/divider1"
				"group/hardware"
				"custom/divider2"
				"group/device"
			];
			"group/hardware" = {
				orientation = "horizontal";
				modules = [
					"cpu"
					"memory"
					"disk"
				];
			};
			"group/device" = {
				orientation = "horizontal";
				modules = [
					"backlight"
	                "pulseaudio"
	                "battery"
				];
			};
			"group/info" = {
				orientation=  "horizontal";
			    modules = [
					"clock"
					"tray"
			    ];
			};
		};
	};
}
