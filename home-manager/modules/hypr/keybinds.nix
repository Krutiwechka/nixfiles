{ pkgs, lib, ... }:

let
  mainMod = "SUPER";
  terminal = "kitty";
  fileManager = "thunar";
  yazi = "kitty --class yazi yazi";
  menu = "rofi -show drun";

  screenshotScript = pkgs.writeShellScript "hypr-screenshot" ''
    dir="$HOME/Pictures/Screenshots"
    mkdir -p "$dir"
    file="$dir/screenshot_$(date +%F_%H-%M-%S).png"
    geom=$(${pkgs.slurp}/bin/slurp)
    if [ -n "$geom" ]; then
      ${pkgs.grim}/bin/grim -g "$geom" "$file"
      ${pkgs.wl-clipboard}/bin/wl-copy < "$file"
    fi
  '';

  screenshotSwappyScript = pkgs.writeShellScript "hypr-screenshot-swappy" ''
    dir="$HOME/Pictures/Screenshots"
    mkdir -p "$dir"
    file="$dir/screenshot_$(date +%F_%H-%M-%S).png"
    geom=$(${pkgs.slurp}/bin/slurp)
    if [ -n "$geom" ]; then
      ${pkgs.grim}/bin/grim -g "$geom" - | ${pkgs.swappy}/bin/swappy -f - -o "$file" && ${pkgs.wl-clipboard}/bin/wl-copy < "$file"
    fi
  '';
in
{
  wayland.windowManager.hyprland.settings = {
    mod = {
      _var = mainMod;
    };

    config = {
      binds = {
        allow_workspace_cycles = true;
        workspace_center_on = 1;
        drag_threshold = 4;
      };
    };

    bind = [
      { _args = [ "${mainMod} + T" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${terminal}\")") ]; }
      { _args = [ "${mainMod} + Q" (lib.generators.mkLuaInline "hl.dsp.window.close()") ]; }
      { _args = [ "${mainMod} + M" (lib.generators.mkLuaInline "hl.dsp.exit()") ]; }
      { _args = [ "${mainMod} + E" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${yazi}\")") ]; }
      { _args = [ "${mainMod} + SHIFT + E" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${fileManager}\")") ]; }
      { _args = [ "${mainMod} + K" (lib.generators.mkLuaInline "hl.dsp.window.float({ action = \"toggle\" })") ]; }
      { _args = [ "${mainMod} + Y" (lib.generators.mkLuaInline "hl.dsp.window.pin()") ]; }
      { _args = [ "${mainMod} + F" (lib.generators.mkLuaInline "hl.dsp.window.fullscreen(1)") ]; }

      { _args = [ "${mainMod} + D" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${menu}\")") ]; }
      { _args = [ "${mainMod} + ALT + D" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"rofi -modi emoji -show emoji -emoji-mode insert -emoji-format '{emoji} {name}' -kb-secondary-copy \\\"\\\" -kb-custom-1 'Control+c'\")") ]; }
      { _args = [ "${mainMod} + ALT + T" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"rofi -show drun -run-command \\\"kitty zsh -ic '{cmd} ; zsh'\\\"\")") ]; }

	  { _args = [ "${mainMod} + SHIFT + R" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"hyprctl reload\")") ]; }
      { _args = [ "${mainMod} + SHIFT + Z" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"pkill waybar && waybar &\")") ]; }
      { _args = [ "${mainMod} + S" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${screenshotScript}\")") ]; }
      { _args = [ "${mainMod} + SHIFT + S" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"${screenshotSwappyScript}\")") ]; }	  { _args = [ "${mainMod} + left" (lib.generators.mkLuaInline "hl.dsp.focus({ direction = 'l' })") ]; }
      { _args = [ "${mainMod} + right" (lib.generators.mkLuaInline "hl.dsp.focus({ direction = 'r' })") ]; }
      { _args = [ "${mainMod} + up" (lib.generators.mkLuaInline "hl.dsp.focus({ direction = 'u' })") ]; }
      { _args = [ "${mainMod} + down" (lib.generators.mkLuaInline "hl.dsp.focus({ direction = 'd' })") ]; }

      { _args = [ "${mainMod} + SHIFT + left" (lib.generators.mkLuaInline "hl.dsp.window.move({ direction = 'l' })") ]; }
      { _args = [ "${mainMod} + SHIFT + right" (lib.generators.mkLuaInline "hl.dsp.window.move({ direction = 'r' })") ]; }
      { _args = [ "${mainMod} + SHIFT + up" (lib.generators.mkLuaInline "hl.dsp.window.move({ direction = 'u' })") ]; }
      { _args = [ "${mainMod} + SHIFT + down" (lib.generators.mkLuaInline "hl.dsp.window.move({ direction = 'd' })") ]; }

      { _args = [ "${mainMod} + 1" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 1 })") ]; }
      { _args = [ "${mainMod} + 2" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 2 })") ]; }
      { _args = [ "${mainMod} + 3" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 3 })") ]; }
      { _args = [ "${mainMod} + 4" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 4 })") ]; }
      { _args = [ "${mainMod} + 5" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 5 })") ]; }
      { _args = [ "${mainMod} + 6" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 6 })") ]; }
      { _args = [ "${mainMod} + 7" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 7 })") ]; }
      { _args = [ "${mainMod} + 8" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 8 })") ]; }
      { _args = [ "${mainMod} + 9" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 9 })") ]; }
      { _args = [ "${mainMod} + 0" (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = 10 })") ]; }

      { _args = [ "${mainMod} + SHIFT + 1" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 1 })") ]; }
      { _args = [ "${mainMod} + SHIFT + 2" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 2 })") ]; }
      { _args = [ "${mainMod} + SHIFT + 3" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 3 })") ]; }
      { _args = [ "${mainMod} + SHIFT + 4" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 4 })") ]; }
      { _args = [ "${mainMod} + SHIFT + 5" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 5 })") ]; }
      { _args = [ "${mainMod} + SHIFT + 6" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 6 })") ]; }
      { _args = [ "${mainMod} + SHIFT + 7" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 7 })") ]; }
      { _args = [ "${mainMod} + SHIFT + 8" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 8 })") ]; }
      { _args = [ "${mainMod} + SHIFT + 9" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 9 })") ]; }
      { _args = [ "${mainMod} + SHIFT + 0" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 10 })") ]; }
      
      { _args = [ "${mainMod} + P" (lib.generators.mkLuaInline "hl.dsp.workspace.toggle_special('magic')") ]; }
      { _args = [ "${mainMod} + SHIFT + P" (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = 'special:magic' })") ]; }
	  { 
	  	_args = [ "XF86AudioRaiseVolume" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+\")") ]; 
		repeat = true;
		locked = true;
	  }
	  
	  {
	   _args = [ "XF86AudioLowerVolume" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-\")") ]; 
		repeat = true;
		locked = true;
	  }		
	  {
	   _args = [ "XF86AudioMute" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle\")") ]; 
		repeat = true;
		locked = true;
	  }
	  { 
	  	_args = [ "XF86AudioMicMute" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle\")") ]; 
		repeat = true;
		locked = true;
	  }
	  
	  {
	   _args = [ "XF86MonBrightnessUp" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"brightnessctl -e4 -n2 set 5%+\")") ]; 
		repeat = true;
		locked = true;
	  }
	  {
	   _args = [ "XF86MonBrightnessDown" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"brightnessctl -e4 -n2 set 5%-\")") ]; 
		repeat = true;
		locked = true;
	  }

      {
       _args = [ "XF86AudioNext" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"playerctl next\")") ]; 
	   locked = true;
	  }
	  {
	   _args = [ "XF86AudioPause" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"playerctl play-pause\")") ]; 
	   locked = true;
	  }
	  {
	   _args = [ "XF86AudioPlay" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"playerctl play-pause\")") ]; 
	   locked = true;
	  }
	  { 
	   _args = [ "XF86AudioPrev" (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"playerctl previous\")") ]; 
		locked = true;
	  }
      { _args = [ "${mainMod} + mouse:272" (lib.generators.mkLuaInline "hl.dsp.window.drag()") ]; 
	    mouse = true;
	  }      
      {
       _args = [ "${mainMod} + mouse:273" (lib.generators.mkLuaInline "hl.dsp.window.resize()") ];
	   mouse = true;	  	  
	  }
    ];
  };
}
