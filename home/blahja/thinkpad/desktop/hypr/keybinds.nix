{
  bind = [
    "$mod, T, exec, $terminal"
    "$mod, Q, killactive,"
    "$mod SHIFT, E, exit,"
    "$mod, E, exec, kitty -e yazi"
    "$mod, V, togglefloating,"
    "$mod, D, exec, $menu"
    "$mod, SPACE, exec, $menu"
    "$mod, F, fullscreen,"
    "$mod, B, exec, $browser"
    "$mod, O, exec, hyprlock"
    "$mod, BACKSPACE, exec, wlogout"
    "$mod SHIFT, R, exec, hyprctl reload"

    "$mod, Print, exec, hyprshot -m window"
    "$mod SHIFT, Print, exec, hyprshot -m output"

    "$mod, C, exec, bash -c 'cliphist list | rofi -dmenu | cliphist decode | wl-copy'"

    "$mod SHIFT, F, exec, kitty --class=walt -e walt"
    "$mod CTRL, D, exec, walt gui"
    "$mod ALT, D, exec, walt random"

    "$mod, H, movefocus, l"
    "$mod, L, movefocus, r"
    "$mod, J, movefocus, u"
    "$mod, K, movefocus, d"

    "$mod SHIFT, H, movewindow, l"
    "$mod SHIFT, L, movewindow, r"
    "$mod SHIFT, J, movewindow, u"
    "$mod SHIFT, K, movewindow, d"

    "$mod, 1, workspace, 1"
    "$mod, 2, workspace, 2"

    "$mod SHIFT, 1, movetoworkspace, 1"
    "$mod SHIFT, 2, movetoworkspace, 2"
  ];

  bindm = [
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
  ];

  binde = [
    ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
    ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
  ];

  bindl = [
    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ", XF86AudioPlay, exec, playerctl play-pause"
    ", XF86AudioNext, exec, playerctl next"
    ", XF86AudioPrev, exec, playerctl previous"
  ];
}
