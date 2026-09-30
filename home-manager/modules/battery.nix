{
	systemd.user.services.battery-voltage-watch = {
  Unit = {
    Description = "Battery voltage threshold monitor";
  };
  Service = {
    ExecStart = "%h/.dotfiles/scripts/battery-voltage-watch.sh";
    Restart = "always";
  };
  Install = {
    WantedBy = [ "default.target" ];
  };
};
}
