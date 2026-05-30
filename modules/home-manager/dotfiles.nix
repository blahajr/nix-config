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
      description = "location where  the dotfiles repository is cloned.";
    };

    fastfetch = {
      enable = lib.mkEnableOption "symlink fastfetch config from the dotfiles repo";

      configPath = lib.mkOption {
        type = lib.types.str;
        default = "shared/fastfetch";
        description = "Path inside the dotfiles repo to the fastfetch directory.";
      };

      sedPattern = lib.mkOption {
        type = lib.types.str;
        default = "s|%USERPROFILE%/.config/shared/fastfetch/ascii.ansi|ascii.ansi|g";
        description = "sed substitute expression applied to config.jsonc after clone.";
      };
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

    home.activation.fastfetchFromDotfiles = lib.mkIf cfg.fastfetch.enable (lib.hm.dag.entryAfter ["dotfiles"] ''
      fastfetch_dir="${cfg.destination}/${cfg.fastfetch.configPath}"
      config="$fastfetch_dir/config.jsonc"
      if [ -f "$config" ]; then
        ${pkgs.gnused}/bin/sed -i ${lib.escapeShellArg cfg.fastfetch.sedPattern} "$config"
        mkdir -p "$HOME/.config"
        ln -sfn "$fastfetch_dir" "$HOME/.config/fastfetch"
      fi
    '');
  };
}
