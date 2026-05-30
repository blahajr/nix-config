{...}: {
  imports = [
    ./theme
    ./rofi.nix
    ./dunst.nix
    ./hypr/services.nix
    ./hypr/hyprland.nix
    ./hypr/hypridle.nix
    ./hypr/hyprlock.nix
    ./hypr/wlogout.nix
    ./waybar/waybar.nix
    ./yazi.nix
  ];
}
