{
  hostName,
  config,
  ...
}: let
  user = config.settings.users.${hostName};
in {
  imports = [
    ../../profiles/common
    ../../profiles/dev
  ];

  home = {
    username = user.name;
    homeDirectory = user.home;
  };

  programs.zsh.enable = true;
}
