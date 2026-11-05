{ ... }:

{
	programs.zathura = {
		enable = true;
		options = {
			default-bg = "#1B1116";
			default-fg = "#EDECF7";
			highlight-color = "#D063A8";
			highlight-active-color = "#A64D82";

			recolor = true;
			recolor-lightcolor = "#1B1116";
			recolor-darkcolor = "#EDECF7";

			selection-clipboard = "clipboard";
			scroll-step = 100;
		};
	};
}
