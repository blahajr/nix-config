{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: let
  gtkCfg = config.settings.theme.gtk;
  wallpaperDir = config.desktop.wallpaperDir;

  capitalize = s:
    lib.toUpper (lib.substring 0 1 s)
    + lib.substring 1 (lib.stringLength s - 1) s;

  waltThemeName = "Catppuccin ${capitalize gtkCfg.variant}";
in {
  home.file.".local/bin/hypr-random-wallpaper" = {
    executable = true;
    text = ''
      #!${pkgs.bash}/bin/bash
      set -euo pipefail
      dir="${wallpaperDir}"
      if [ ! -d "$dir" ]; then
        exit 0
      fi
      img="$(${pkgs.findutils}/bin/find "$dir" -type f \
        \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) \
        -print0 | ${pkgs.coreutils}/bin/shuf -z -n1 | ${pkgs.coreutils}/bin/tr -d '\0')"
      [ -n "$img" ] || exit 0
      ${pkgs.hyprland}/bin/hyprctl hyprpaper preload "$img" 2>/dev/null || true
      ${pkgs.hyprland}/bin/hyprctl hyprpaper wallpaper ",contain:$img" 2>/dev/null || true
    '';
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
    };
  };

  home.packages = [
    inputs.walt.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  xdg.configFile."walt/paths.conf".text = ''
    ${wallpaperDir}
  '';

  xdg.configFile."walt/theme.conf".text = "${waltThemeName}\n";
}
