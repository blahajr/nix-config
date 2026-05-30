{...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 1;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
          noise = "0.0117";
          contrast = "1.1";
          brightness = "0.85";
          vibrancy = "0.2";
        }
      ];

      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo "<b>$(date +"%H:%M")</b>"'';
          color = "rgba(224, 222, 244, 0.95)";
          font_size = 96;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:60000] echo "<b>$(date +"%A, %B %d")</b>"'';
          color = "rgba(224, 222, 244, 0.85)";
          font_size = 24;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 100";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 50";
          outline_thickness = 2;
          dots_size = 0.25;
          dots_spacing = 0.3;
          dots_center = true;
          outer_color = "rgba(196, 167, 231, 1.0)";
          inner_color = "rgba(35, 33, 54, 0.85)";
          font_color = "rgba(224, 222, 244, 1.0)";
          fade_on_empty = false;
          placeholder_text = "<i>Password...</i>";
          position = "0, -80";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
