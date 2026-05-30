{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.home.dotfiles;
in {
  options.home.dotfiles = {
    enable = lib.mkEnableOption "dotfiles";

    url = lib.mkOption {
      type = lib.types.str;
      example = "https://github.com/user/dotfiles";
      description = "Git repo to clone into the destination directory.";
    };

    destination = lib.mkOption {
      type = lib.types.str;
      default = "${config.home.homeDirectory}/.dotfiles";
      description = "Location where the dotfiles repository is cloned.";
    };
  };

  config = lib.mkIf cfg.enable {
    home.activation.dotfiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
      if [ -d "${cfg.destination}/.git" ]; then
        ${pkgs.git}/bin/git -C "${cfg.destination}" pull --ff-only
      else
        ${pkgs.git}/bin/git clone ${lib.escapeShellArg cfg.url} ${lib.escapeShellArg cfg.destination}
      fi
    '';
  };
}
