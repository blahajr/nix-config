{
  hostName,
  config,
  ...
}: let
  user = config.settings.users.${hostName};
in {
  imports = [../common];

  home = {
    username = user.name;
    homeDirectory = user.home;
  };

  programs.zsh.enable = true;
}
