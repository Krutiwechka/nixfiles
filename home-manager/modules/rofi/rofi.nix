{
  programs.rofi = {
    enable = true;

    settings = {
      modes = [ "drun" "filebrowser" "run" "ssh" ];
      font = "FiraCode Mono Medium 12";
      location = 0; # center
      xoffset = 0;
      yoffset = 0;
      terminal = "kitty";
      cycle = true;

      fixed-num-lines = true;
      show-icons = true;
      run-shell-command = "{terminal} -e zsh -ic '{cmd} && read'";
      icon-theme = "candy-icons";

      drun-match-fields = "name,generic,exec,categories,keywords";
      drun-show-actions = true;
      drun-display-format = "{name} [<span alpha='40%'><i>{generic}</i></span>]";
      drun-url-launcher = "xdg-open";
      drun-use-desktop-cache = true;
      drun-reload-desktop-cache = false;

      disable-history = false;
      sort = true;
      sorting-method = "normal";
      case-sensitive = false;
      case-smart = true;
      sidebar-mode = true;
      eh = 1;
      auto-select = false;

      parse-hosts = true;
      parse-known-hosts = true;
      combi-modes = "window,drun,run";

#     matching = "fuzzy";
      tokenize = true;
      m = "-2";
      dpi = -1;
      threads = 0;
      scroll-method = 1;
      click-to-exit = true;
      global-kb = false;
      max-history-size = 100;
      normalize-match = true;
      steal-focus = true;
      refilter-timeout-limit = 50;
      completer-mode = "filebrowser";

      pid = "/run/user/1000/rofi.pid";

      display-window = "  Windows";
      display-run = "  Run";
      display-ssh = "  SSH";
      display-combi = "  Apps";
      display-recursivebrowser = "   Files";

      kb-accept-custom = "Control+Return";
      kb-mode-next = "Shift+Right,Tab";
      kb-element-next = "Ctrl+Tab";

      timeout = {
        action = "kb-cancel";
        delay = 0;
      };

      filebrowser = {
        directory = "/home/timojj";
        directories-first = true;
        sorting-method = "name";
      };
    };
  };
}
