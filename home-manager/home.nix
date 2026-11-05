{ config, pkgs, inputs, ... }:

{
	imports = [
		./modules
		./pkgs.nix
	];
	home.username = "timojj";
	home.homeDirectory = "/home/timojj";
	home.stateVersion = "26.05";
	home.sessionVariables = {
	  EDITOR = "nvim";
	};
	programs.home-manager.enable = true;
}
