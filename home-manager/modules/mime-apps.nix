{ ... }:

{
	xdg.desktopEntries.nvim = {
		name = "Neovim";
		genericName = "Text Editor";
		exec = "kitty nvim %F";
		categories = [ "Utility" "TextEditor" ];
	};

	xdg.mimeApps = {
		enable = true;
		defaultApplications = {
			"text/plain" = [ "nvim.desktop" ];
			"text/markdown" = [ "nvim.desktop" ];
			"application/json" = [ "nvim.desktop" ];
			"text/x-shellscript" = [ "nvim.desktop" ];

			"application/pdf" = [ "zen.desktop" ];
			"application/epub+zip" = [ "com.github.johnfactotum.Foliate.desktop" ];

			"image/png" = [ "com.interversehq.qView.desktop" ];
			"image/jpeg" = [ "com.interversehq.qView.desktop" ];
			"image/gif" = [ "com.interversehq.qView.desktop" ];
			"image/webp" = [ "com.interversehq.qView.desktop" ];

			"video/mp4" = [ "vlc.desktop" ];
			"video/x-matroska" = [ "vlc.desktop" ];
			"video/webm" = [ "vlc.desktop" ];

			# migrated from ~/.config/mimeapps.list
			"x-scheme-handler/tg" = [ "org.telegram.desktop.desktop" ];
			"x-scheme-handler/tonsite" = [ "org.telegram.desktop.desktop" ];
			"x-scheme-handler/zcode" = [ "zcode.desktop" ];
		};

		associations.added = {
			"application/pdf" = [ "com.github.johnfactotum.Foliate.desktop" ];
			"text/html" = [ "zen.desktop" ];
		};
	};
}
