{config, ...}:
{
  services.hyprpaper = {
    enable = true;
	
    settings = {
      splash = false;

      wallpaper = [
      	{
      		monitor = "";
      		path = "~/.dotfiles/home-manager/modules/hypr/wallpapers/wallpaper1.png";
      	}
      ];
    };
  };
}
