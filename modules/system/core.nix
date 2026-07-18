{config, ...}: let
  settings = config.settings;
in {
  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;

  time.timeZone = settings.timeZone;

  environment.variables = {
    EDITOR = settings.editor.default;
    VISUAL = settings.editor.default;
  };

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      flake-registry = "";
      download-buffer-size = 1073741824;
    };
    channel.enable = false;
  };

  programs.nix-ld.enable = true;
}
