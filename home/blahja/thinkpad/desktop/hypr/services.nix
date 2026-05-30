#systemmd stuff
{
  pkgs,
  config,
  ...
}: {
  systemd.user.services = {
    nm-applet = {
      Unit = {
        Description = "NW tray icon";
        PartOf = ["hyprland-session.target"];
        After = ["hyprland-session.target"];
      };
      Service = {
        ExecStart = "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator";
        Restart = "on-failure";
      };
      Install.WantedBy = ["hyprland-session.target"];
    };

    cliphist-wl-paste-text = {
      Unit = {
        Description = "cliphist: stores the text clipboard history";
        PartOf = ["hyprland-session.target"];
        After = ["hyprland-session.target"];
      };
      Service = {
        ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store";
        Restart = "on-failure";
      };
      Install.WantedBy = ["hyprland-session.target"];
    };

    cliphist-wl-paste-image = {
      Unit = {
        Description = "cliphist: stores the  image clipboard history";
        PartOf = ["hyprland-session.target"];
        After = ["hyprland-session.target"];
      };
      Service = {
        ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store";
        Restart = "on-failure";
      };
      Install.WantedBy = ["hyprland-session.target"];
    };

    hypr-wallpaper-random = {
      Unit = {
        Description = "Sets a random wallpaper on login";
        After = ["hyprland-session.target" "hyprpaper.service"];
        PartOf = ["hyprland-session.target"];
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.bash}/bin/bash -lc 'sleep 2; walt random || hypr-random-wallpaper || true'";
      };
      Install.WantedBy = ["hyprland-session.target"];
    };
  };
}
