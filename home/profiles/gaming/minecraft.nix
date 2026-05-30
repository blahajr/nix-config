{pkgs, ...}: {
  home.packages = with pkgs; [
    prismlauncher
    modrinth-app
  ];
}
