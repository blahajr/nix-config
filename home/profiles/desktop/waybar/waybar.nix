{pkgs, ...}: {
  imports = [./style.nix];

  home.packages = with pkgs; [
    pavucontrol
    networkmanagerapplet
    playerctl
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      mode = "dock";
      height = 35;
      exclusive = true;
      passthrough = false;
      "gtk-layer-shell" = true;

      "modules-left" = ["custom/left" "custom/rofi" "backlight" "pulseaudio" "battery" "custom/right"];
      "modules-center" = ["custom/left" "hyprland/workspaces" "custom/right"];
      "modules-right" = ["custom/left" "tray" "clock" "custom/right"];

      "custom/rofi" = {
        id = "custom-rofi";
        format = "  {}";
        "on-click" = "rofi -show drun";
      };

      "hyprland/workspaces" = {
        id = "workspaces";
        "disable-scroll" = true;
        "all-outputs" = true;
        "on-click" = "activate";
        "persistent-workspaces" = {
          "1" = [];
          "2" = [];
        };
      };

      battery = {
        states = {
          good = 95;
          warning = 30;
          critical = 20;
        };
        format = "{icon} {capacity}%";
        "format-charging" = " {capacity}%";
        "format-plugged" = " {capacity}%";
        "format-icons" = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
      };

      pulseaudio = {
        format = "{icon} {volume}%";
        "format-muted" = "󰖁";
        "on-click" = "pavucontrol -t 3";
        "on-click-middle" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "on-scroll-up" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "on-scroll-down" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "scroll-step" = 5;
        "format-icons" = {
          headphone = "";
          "hands-free" = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = ["" "" ""];
        };
      };

      tray = {
        "icon-size" = 20;
        spacing = 9;
      };

      clock = {
        format = " {:%H:%M  %a %d %b}";
        "format-alt" = " {:%H:%M:%S  %A %d %B %Y}";
        "tooltip-format" = "<big>{:%Y %B %d}</big>\n<tt><small>{calendar}</small></tt>";
      };

      backlight = {
        "on-scroll-up" = "brightnessctl set +5%";
        "on-scroll-down" = "brightnessctl set 5%-";
        format = "{icon} {percent}%";
        "format-icons" = ["󰃞" "󰃟" "󰃠" "󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󰛨"];
      };

      "custom/left" = {
        id = "custom-left";
        format = " ";
        interval = "once";
        tooltip = false;
      };

      "custom/right" = {
        id = "custom-right";
        format = " ";
        interval = "once";
        tooltip = false;
      };
    };
  };
}
