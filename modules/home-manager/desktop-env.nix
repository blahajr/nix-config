{
  lib,
  config,
  ...
}: {
  options.desktop = {
    wallpaperDir = lib.mkOption {
      type = lib.types.str;
      description = " directory for the  wallpaper images for Walt / hyprpaper.";
      default = "${config.home.homeDirectory}/.dotfiles/shared/catppuccin/anime-style";
    };

    terminal = lib.mkOption {
      type = lib.types.str;
      default = "kitty";
    };

    browser = lib.mkOption {
      type = lib.types.str;
      default = "firefox";
    };
  };

  config = {
    home.sessionVariables = {
      TERMINAL = config.desktop.terminal;
      BROWSER = config.desktop.browser;

      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_SCREENSHOTS_DIR = "$HOME/Pictures/screenshots";

      JAVA_AWT_WM_NOREPARENTING = "1";
      LC_ALL = "en_US.UTF-8";
    };

    home.sessionPath = [
      "$HOME/.local/bin"
      "$HOME/go/bin"
    ];
  };
}
