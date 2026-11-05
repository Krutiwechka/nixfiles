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

			"application/pdf" = [ "org.pwmt.zathura.desktop" ];
			"application/epub+zip" = [ "com.github.johnfactotum.Foliate.desktop" ];

			"image/png" = [ "com.interversehq.qView.desktop" ];
			"image/jpeg" = [ "com.interversehq.qView.desktop" ];
			"image/gif" = [ "com.interversehq.qView.desktop" ];
			"image/webp" = [ "com.interversehq.qView.desktop" ];

			"video/mp4" = [ "vlc.desktop" ];
			"video/x-matroska" = [ "vlc.desktop" ];
			"video/webm" = [ "vlc.desktop" ];
		};
	};
}
