{pkgs, ...}:

{
	users.defaultUserShell = pkgs.zsh;
	users.users.timojj = { 	#'passwd' to set password
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" "docker" ]; 
	};
}
