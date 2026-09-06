{ config, pkgs, lib, ... }: 

{
  programs.zsh = {
    enable = true;

	#plugins
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

	#history
	history = {
	      size = 2048;
	      save = 4096;
	      path = "${config.home.homeDirectory}/.histfile";
	};
	
	#aliases
    shellAliases = {
		tg = "Telegram";
      	mc = "micro";
      	t = "trans";
      	tt = "trans :en";

      	shut = "shutdown now";
		hib = "sudo systemctl hibernate";
      	newyear = "bash ~/Downloads/hy.sh";
		cdd = "cd ${config.home.homeDirectory}/.dotfiles";
		pkgs = "micro ${config.home.homeDirectory}/.dotfiles/home-manager/pkgs.nix";
        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gp = "git push";

		cat = "bat";
		find = "fd";

        ".." = "cd ..";
      };
		initContent = ''
		  #fastfetch
		  ${pkgs.fastfetch}/bin/fastfetch

		  eval "$(${pkgs.starship}/bin/starship init zsh)"

		  autoload -Uz add-zsh-hook
		  add-zsh-hook precmd transient-prompt-precmd
		  TRANSIENT_PROMPT="''${PROMPT// prompt / prompt --profile transient }"
		  TRANSIENT_RPROMPT="''${PROMPT// prompt / prompt --profile rtransient }"
		  function transient-prompt-precmd {
		      TRAPINT() { transient-prompt; return $(( 128 + $1 )) }
		      SAVED_PROMPT="$(eval "printf '%s' \"''${TRANSIENT_PROMPT}\"")"
		      SAVED_RPROMPT="$(eval "printf '%s' \"''${TRANSIENT_RPROMPT}\"")"
		  }
		  autoload -Uz add-zle-hook-widget
		  add-zle-hook-widget zle-line-finish transient-prompt
		  function transient-prompt() {
		      PROMPT="$SAVED_PROMPT" RPROMPT="$SAVED_RPROMPT" zle .reset-prompt
		  }
		'';
   };
}
