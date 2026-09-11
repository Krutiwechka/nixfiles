{ config, pkgs, inputs, ...}:

{
	home.packages = with pkgs; [

		#workflow

		#utils
		wl-clipboard
		brightnessctl
		cliphist
		xclip
		tree
		zip
		unzip
		wget
		bottom
		ntfs3g
		udisks
		ripgrep
		fd
		#cli
		micro
		vim

		cmatrix
		#apps
		telegram-desktop
		tetrio-desktop

		qview
		zathura
		vlc
		foliate
		onlyoffice-desktopeditors
		#font
		nerd-fonts.fira-code
	];
}
