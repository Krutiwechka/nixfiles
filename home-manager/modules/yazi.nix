{ ... }:

{
	programs.yazi = {
		enable = true;
		enableZshIntegration = true;

		# detach the generic opener from the session so apps opened via Enter
		# survive yazi exit and terminal close
		settings.opener.open = [
			{
				run = "setsid xdg-open \"$@\"";
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
