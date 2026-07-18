{pkgs, ...}: {
  home.packages = with pkgs; [
    firefox
    vscode
    google-chrome
  ];
}
