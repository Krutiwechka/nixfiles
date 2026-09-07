{config, ...}:

{
programs.git = {
		enable = true;
		settings.user.name = "Timojj";
		settings.user.email = "krutiwechka@gmail.com";
		settings.init.defaultBranch = "main";
	};
}
