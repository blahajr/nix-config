{config, ...}: let
  c = config.settings.theme.colors;
in {
  programs.waybar.style = ''
    * {
      border: none;
      border-radius: 0px;
      font-family: "JetBrainsMono Nerd Font";
      font-weight: bold;
      font-size: 15px;
      min-height: 13px;
    }

    window#waybar {
      background-color: rgba(0, 0, 0, 0);
    }

    #battery,
    #temperature,
    #clock,
    #workspaces,
    #custom-rofi,
    #tray,
    #pulseaudio,
    #backlight,
    #network,
    #custom-right,
    #custom-left {
      color: ${c.text};
      background: ${c.surface0};
      margin: 4px 0px 4px 0px;
      opacity: 1;
      border: 0px solid ${c.mantle};
    }

    tooltip {
      background: ${c.surface0};
      color: ${c.text};
      border-radius: 22px;
      border-width: 2px;
      border-style: solid;
      border-color: ${c.surface1};
    }

    #workspaces button {
      box-shadow: none;
      text-shadow: none;
      padding: 0px;
      border-radius: 9px;
      margin-top: 3px;
      margin-bottom: 3px;
      padding-left: 3px;
      padding-right: 3px;
      color: ${c.text};
      transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.682);
    }

    #workspaces button.active {
      background: ${c.surface1};
      color: ${c.mauve};
      margin-left: 3px;
      padding-left: 12px;
      padding-right: 12px;
      margin-right: 3px;
      transition: all 0.3s cubic-bezier(0.55, -0.68, 0.48, 1.682);
    }

    #workspaces button:hover {
      background: ${c.mantle};
      border: none;
    }

    #workspaces {
      padding: 0px;
      padding-left: 5px;
      padding-right: 5px;
    }

    #custom-rofi {
      color: ${c.flamingo};
      padding-left: 0px;
      padding-right: 10px;
    }

    #temperature {
      color: ${c.teal};
      padding-left: 0px;
      padding-right: 19px;
    }

    #temperature.critical {
      color: ${c.maroon};
      padding-left: 0px;
      padding-right: 19px;
    }

    #backlight {
      color: ${c.yellow};
      padding-left: 0px;
      padding-right: 19px;
    }

    #pulseaudio {
      color: ${c.mauve};
      padding-left: 0px;
      padding-right: 19px;
    }

    #battery {
      color: ${c.blue};
      padding-left: 0px;
      padding-right: 0px;
    }

    #tray {
      padding-left: 0px;
      padding-right: 19px;
    }

    #network {
      padding-left: 0px;
      padding-right: 19px;
    }

    #clock {
      color: ${c.peach};
      padding-left: 0px;
      padding-right: 0px;
    }

    #custom-right {
      margin-right: 9px;
      padding-right: 3px;
      border-radius: 0px 22px 22px 0px;
    }

    #custom-left {
      margin-left: 9px;
      padding-left: 3px;
      border-radius: 22px 0px 0px 22px;
    }
  '';
}
