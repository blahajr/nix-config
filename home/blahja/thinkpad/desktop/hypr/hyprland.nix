{
  pkgs,
  ...
}: let
  keybinds = import ./keybinds.nix;
  windowrules = import ./windowrules.nix;
in {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    systemd.variables = ["--all"];
    package = null;
    portalPackage = null;

    settings =
      {
        "$mod" = "SUPER";
        "$terminal" = "kitty";
        "$menu" = "rofi -show drun";
        "$fileManager" = "kitty -e yazi";
        "$browser" = "firefox";

        monitor = [",preferred,auto,1"];

        env = [
          "HYPRCURSOR_SIZE,24"
          "XCURSOR_SIZE,24"
        ];

        input = {
          kb_layout = "us";
          follow_mouse = 1;
          sensitivity = 0;
          touchpad = {
            natural_scroll = true;
            disable_while_typing = true;
          };
        };

        general = {
          gaps_in = 10;
          gaps_out = 12;
          border_size = 2;
          resize_on_border = false;
          allow_tearing = false;
          layout = "dwindle";
        };

        decoration = {
          rounding = 10;
          active_opacity = 1.0;
          inactive_opacity = 1.0;
          blur = {
            enabled = true;
            size = 3;
            passes = 1;
          };
        };

        animations = {
          enabled = true;
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };

        dwindle = {
          preserve_split = true;
          force_split = 2;
        };

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };
      }
      // keybinds
      // windowrules;
  };
}
