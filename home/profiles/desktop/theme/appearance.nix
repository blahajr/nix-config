{
  config,
  pkgs,
  ...
}: let
  c = config.settings.theme.colors;
in {
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 18;
    };

    settings = {
      background = c.base;
      foreground = c.text;
      cursor = c.rosewater;
      cursor_text_color = c.base;
      selection_background = c.surface1;
      selection_foreground = c.text;

      italic_font = "auto";
      bold_italic_font = "auto";

      hide_window_decorations = "yes";
      window_margin_width = 2;
      cursor_trail = 1;

      sync_to_monitor = "yes";

      term = "xterm-256color";
      background_opacity = "0.75";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "qtct";
  };
}
