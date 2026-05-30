#logout stuff
{...}: {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "shutdown";
        action = "sleep 1; systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "sleep 1; systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "logout";
        action = "sleep 1; hyprctl dispatch exit";
        text = "Exit";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "sleep 1; systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "lock";
        action = "sleep 1; hyprlock";
        text = "Lock";
        keybind = "l";
      }
    ];
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", FontAwesome, sans-serif;
        background-image: none;
        transition: 20ms;
      }
      window {
        background-color: rgba(12, 12, 12, 0.5);
      }
      button {
        color: #e0def4;
        font-size: 20px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        border-style: solid;
        background-color: rgba(35, 33, 54, 0.6);
        border: 3px solid #c4a7e7;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        margin: 10px;
        border-radius: 20px;
      }
      button:focus,
      button:active,
      button:hover {
        color: #9ccfd8;
        background-color: rgba(35, 33, 54, 0.85);
        border: 3px solid #9ccfd8;
      }
    '';
  };
}
