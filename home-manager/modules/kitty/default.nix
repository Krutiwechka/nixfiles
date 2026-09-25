{config, ...}:

{
	imports = [
		./colors.nix
	];
	programs.kitty = {
		enable = true;
		font = {
		    name = "FiraCode Nerd Font Mono";
		    size = 13.0;
		};
		
		settings = {
		    bold_font = "auto";
		    italic_font = "auto";
		    bold_italic_font = "auto";
		    
		    force_ltr  = false;
		    disable_ligatures = "cursor";

		    cursor_shape = "block";
	        cursor_shape_unfocused = "hollow";
	        cursor_blink_interval = 0;
	        cursor_trail = 1;
			
			scrollback_lines = 5000;
	        scrollbar = "hovered";
	        scrollback_fill_enlarged_window = true;
			wheel_scroll_multiplier = "5.0";

			mouse_hide_wait = "-1.0";
			url_style = "curly";
			copy_on_select = true; 		

			notify_on_cmd_finish = ''unfocused 10.0 command notify-send "Kitty: command [%c] completed"'';

			enable_audio_bell = false;
			bell_on_tab = "!";
					
		    window_border_width = 0;
		    draw_minimal_borders = true;
		    single_window_margin_width = 0;
		    window_padding_width  = 0;
		    single_window_padding_width = 0;
		    hide_window_decorations = true;
		
		    window_logo_path  = toString ./pics/kafka_kitty.png;
		    window_logo_position = "bottom-right";
		    window_logo_alpha = "0.2";
		    window_logo_scale = 15;
		    confirm_os_window_close = 0;
	    
	        tab_bar_style = "powerline";
	        tab_bar_align = "left";
	        tab_bar_min_tabs = 2;
	        tab_powerline_style = "slanted";
	        tab_activity_symbol = "*";
	    
	        selection_foreground = "#0D0726";
	        selection_background = "#EDECF7";
	    	kitty_mod = "ctrl+shift";
	        editor = "micro";
		};	
			
		keybindings = {
		    "ctrl+c" = "copy_or_noop";
		    "kitty_mod+v" = "paste_from_clipboard";
		    "ctrl+v" = "paste_from_clipboard";
		    "kitty_mod+s" = "paste_from_selection";
		    "kitty_mod+o" = "pass_selection_to_program";

		    "kitty_mod+up" = "scroll_line_up";
		    "kitty_mod+page_up" = "scroll_page_up";
		    "kitty_mod+down" = "scroll_line_down";
		    "kitty_mod+home" = "scroll_home";
		    "kitty_mod+end" = "scroll_end";
		    "kitty_mod+z" = "scroll_to_prompt -1";
		    "kitty_mod+x" = "scroll_to_prompt 1";
		    "kitty_mod+h" = "show_scrollback";
		    "kitty_mod+g" = "show_last_command_output";

			#"kitty_mod+n" = "launch --location=neighbor";
			"kitty_mod+f" = "launch --location=first";
		    "kitty_mod+enter" = "launch --cwd=current";
		    "kitty_mod+n" = "new_os_window_with_cwd";
		    "kitty_mod+w" = "close_window";
		};
	};
}
