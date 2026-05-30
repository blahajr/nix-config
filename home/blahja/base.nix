{
  pkgs,
  ...
}: {
  imports = [
    ../common
    ./shell.nix
  ];

  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];
}
