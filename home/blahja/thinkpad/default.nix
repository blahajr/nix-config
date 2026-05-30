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
    ../base.nix
    inputs.self.homeManagerModules.desktopEnv
    inputs.self.homeManagerModules.dotfiles
    ./apps.nix
    ./games.nix
    ./desktop
    ./persistence.nix
  ];

  home = {
    username = user.name;
    homeDirectory = user.home;
  };

  home.dotfiles = {
    enable = true;
    url = "https://github.com/blahajr/dotfiles";
    fastfetch.enable = true;
  };
}
