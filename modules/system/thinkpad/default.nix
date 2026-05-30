{...}: {
  imports = [
    ../core.nix
    ../packages.nix
    ../ssh.nix
    ./boot.nix
    ./network.nix
    ../security.nix
    ./laptop.nix
    ./desktop/display.nix
    ./desktop/hyprland.nix
  ];
}
