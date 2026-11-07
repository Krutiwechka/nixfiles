{ pkgs, ... }:

{
	# foliate (libadwaita) follows the global color-scheme, so run it in light
	# and restore the dark scheme on exit
	home.packages = [
		(pkgs.writeShellScriptBin "foliate-light" ''
			gsettings set org.gnome.desktop.interface color-scheme "default"
			${pkgs.foliate}/bin/foliate "$@"
			gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
		'')
	];

	# user-level entry shadows the package one and launches the wrapper
	xdg.desktopEntries."com.github.johnfactotum.Foliate" = {
		name = "Foliate";
		exec = "foliate-light %U";
		icon = "com.github.johnfactotum.Foliate";
		categories = [ "Office" "Viewer" ];
		mimeType = [
			"application/epub+zip"
			"application/x-mobipocket-ebook"
			"application/vnd.amazon.mobi8-ebook"
			"application/x-fictionbook+xml"
			"application/x-zip-compressed-fb2"
			"application/vnd.comicbook+zip"
			"x-scheme-handler/opds"
		];
	};
}
