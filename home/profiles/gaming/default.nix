{pkgs, ...}: {
  imports = [
    ./steam.nix
    ./minecraft.nix
  ];

  home.packages = with pkgs; [
    heroic
  ];
}
