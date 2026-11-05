{ config, pkgs, inputs, ...}:

{
	home.packages = with pkgs; [

		#workflow
		wineWow64Packages.stable
		winetricks
		#rust
		rustc
		cargo
		rustfmt
		clippy
		rust-analyzer
		gcc
		#utils
		brightnessctl
		cliphist
		playerctl
		libnotify
		xclip
		tree
		zip
		unzip
		wget
		ntfs3g
		udisks
		ripgrep
		fd
		btop
		#cli
		micro

		cmatrix
		#apps
		telegram-desktop
		tetrio-desktop
		pavucontrol

		qview
		zathura
		vlc
		foliate
		gimp
		onlyoffice-desktopeditors
		#font
		nerd-fonts.fira-code
	];
}
