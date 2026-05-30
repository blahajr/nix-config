{
  inputs,
  hostName,
  config,
  ...
}: let
  user = config.settings.users.${hostName};
in {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    ../default.nix
    inputs.self.homeManagerModules.desktopEnv
    inputs.self.homeManagerModules.dotfiles
    ../../../profiles/apps
    ../../../profiles/gaming
    ../../../profiles/desktop
  ];

  home = {
    username = user.name;
    homeDirectory = user.home;
  };

  home.dotfiles = {
    enable = true;
    url = "https://github.com/blahajr/dotfiles";
  };
}
