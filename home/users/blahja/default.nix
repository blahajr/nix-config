{pkgs, ...}: {
  imports = [
    ../../profiles/common
    ../../profiles/dev
    ./fastfetch.nix
    ./shell.nix
  ];

  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];
}
