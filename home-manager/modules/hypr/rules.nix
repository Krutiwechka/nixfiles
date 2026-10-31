{lib, ...}:
{
	wayland.windowManager.hyprland.settings = {
    	window_rule = [
#    		{
#    			match.class = "thunar";
#    			float = true;
#    			pin = true;
#    			size = "1000 800";
#    			center = true;
#    		}
    		{
    			match.class = ".*";
    			suppress_event = "maximize";
    		}
    		{
    			match = {
    				class = "^$";
    				title = "^$";
    				xwayland = true;
    				float = true;
    				fullscreen = false;
    				pin = false;
    			};
    			no_initial_focus = true;
    		}
    		{
    			match.modal = true;
    			float = true;
    			size = "1000 800";
    			move = "200 200";
    		}
    		{
    			match.class = "org.telegram.desktop";
    			workspace = "5";
    		}
    		{
    		    match.class = "md.Obsidian";
    		   	workspace = "4";
    		}
    		{ 
    			match.title = "Picture-in-Picture";
    		 	float = true; 
    		 	pin = true; 
    			no_initial_focus = true; 
    		}
    		{ 
    		    match.title = "Library";
    		    float = true; 
    		    pin = true; 
    		    no_initial_focus = true;
    		   	size = "1000 800";
    		   	move = "200 200";
    		   	     			 
    		}
		
   			{
   				match = { 	
   					float = false;
   					workspace = "w[tv1]";
   					class = "negative:kitty"; 
   		  		};
   		  		border_size = 0;
			}    		  
    	];
    	layer_rule = [
			{
				match.namespace = "^rofi$";
				blur = true;
			}
    	];
    	on = [
    	      {
    	        _args = [
    	          "window.open"
    	          (lib.generators.mkLuaInline ''
    	            function(w)
    	              if w.class == "thunar" or w.class == "Thunar" then
    	                hl.dispatch(hl.dsp.window.float({ action = "set", window = w }))
    	                hl.dispatch(hl.dsp.window.resize({ x = 1000, y = 800, window = w }))
    	                hl.dispatch(hl.dsp.window.center({ window = w }))
    	              end
    	            end
    	          '')
    	  ];
	
    	 }
	  {
    _args = [
      "window.title"
      (lib.generators.mkLuaInline ''
        function(w)
          if not w.floating
             and string.find(w.title, "Extension: (Bitwarden Password Manager)", 1, true) then
            hl.dispatch(hl.dsp.window.float({ action = "set", window = w }))
            hl.dispatch(hl.dsp.window.resize({ x = 500, y = 400, window = w }))
            hl.dispatch(hl.dsp.window.center({ window = w }))
            hl.dispatch(hl.dsp.window.pin({ action = "set", window = w }))
          end
        end
      '')
    ];
  }
    	];
  	};
}
