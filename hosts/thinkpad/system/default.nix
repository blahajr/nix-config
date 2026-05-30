{...}: {
  imports = [
    ../../../modules/system/core.nix
    ../../../modules/system/packages.nix
    ../../../modules/system/ssh.nix
    ./boot.nix
    ../../../modules/system/security.nix
    ./laptop.nix
    ./desktop/display.nix
    ./desktop/hyprland.nix
  ];
}
