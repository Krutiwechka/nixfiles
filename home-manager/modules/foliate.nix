{ pkgs, ... }:

{
	# foliate (libadwaita) follows the global color-scheme, so run it in light
	# and restore the dark scheme on exit
	home.packages = [
		(pkgs.writeShellScriptBin "foliate" ''
			${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'default'"
			${pkgs.foliate}/bin/foliate "$@"
			${pkgs.dconf}/bin/dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
		'')
		# keep the app icon in the profile since the real foliate package
		# is only referenced from the wrapper script
		(pkgs.runCommand "foliate-icon" { } ''
			mkdir -p "$out/share/icons"
			cp -r "${pkgs.foliate}/share/icons/hicolor" "$out/share/icons/"
		'')
	];

	# user-level entry shadows the package one and points at the wrapper
	xdg.desktopEntries."com.github.johnfactotum.Foliate" = {
		name = "Foliate";
		exec = "foliate %U";
		icon = "com.github.johnfactotum.Foliate";
		categories = [ "Office" "Viewer" ];
		mimeType = [
			"application/epub+zip"
			"application/x-mobipocket-ebook"
			"application/x-fictionbook+xml"
			"application/vnd.amazon.mobi8-ebook"
			"application/vnd.comicbook+zip"
			"x-scheme-handler/opds"
		];
	};
}
