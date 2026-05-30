#todo make this replicable incase i want to use my main desk?
{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.dconf.enable = true;
  programs.thunar.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal
    ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
    cliphist
    wlr-randr
    grim
    slurp
    swappy
    hyprshot
    hyprpicker
    hyprcursor
    libnotify
  ];

  fonts.packages = with pkgs; [
    noto-fonts-color-emoji
    font-awesome
    material-icons
    nerd-fonts.jetbrains-mono
  ];

  security.pam.services.hyprlock = {};
}
