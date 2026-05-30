#shared stuff between laptop and homelab / whatever in future
{
  config,
  ...
}: {
  imports = [
    ../../modules/settings.nix
    ./packages.nix
    ./dev
  ];

  programs.${config.settings.editor.homeProgram}.enable = true;
  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = config.settings.editor.default;
    VISUAL = config.settings.editor.default;
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = config.settings.git.userName;
      email = config.settings.git.userEmail;
    };
  };

  home.stateVersion = "25.11";
}
