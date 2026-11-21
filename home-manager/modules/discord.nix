{ pkgs, ... }:

{
	programs.discord = {
		enable = true;
		package = pkgs.discord;

		# nixpkgs discord handles updates itself, skip the update nag
		settings.SKIP_HOST_UPDATE = true;
	};

	# pre-seed the autostart entry as disabled: discord creates it enabled on
	# first run, and since HM manages this file it cannot silently re-enable
	# (autostart is not configurable via settings.json)
	xdg.configFile."autostart/discord.desktop".text = ''
		[Desktop Entry]
		Type=Application
		Exec=discord
		Hidden=true
		X-GNOME-Autostart-enabled=false
		Name=Discord
	'';
}
