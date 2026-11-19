{ ... }:

{
	programs.yazi = {
		enable = true;
		enableZshIntegration = true;

		# xdg-open itself doesn't wait for the GUI app it forks, so yazi
		# closes the pipe and the app exits; orphan = true redirects
		# stdout/stderr to /dev/null (the same fix as upstream PR #3581)
		settings.opener.open = [
			{
				run = "xdg-open %s1"; 
 				desc = "Open";
				orphan = true;
				for = "unix";
			}
		];

		keymap.mgr.prepend_keymap = [
			# quick access
			{ on = [ "g" "d" ]; run = "cd ~/Downloads"; desc = "Go ~/Downloads"; }
			{ on = [ "g" "l" ]; run = "cd ~/labs"; desc = "Go ~/labs"; }
			{ on = [ "g" "D" ]; run = "cd ~/Documents"; desc = "Go ~/Documents"; }
			# search
			{ on = "F"; run = "search --via=fd"; desc = "Search file names (fd)"; }
			{ on = "S"; run = "search --via=rg"; desc = "Search file contents (ripgrep)"; }
		];
	};
}
