{
  lib,
  ...
}: let
  inherit (lib) types;

  userModule = types.submodule {
    options = {
      name = lib.mkOption {
        type = types.str;
        description = "Login and Home Manager username for this host.";
      };
      home = lib.mkOption {
        type = types.str;
        description = "Home directory path.";
      };
    };
  };
in {
  options.settings = {
    timeZone = lib.mkOption {
      type = types.str;
      default = "America/New_York";
    };

    git = lib.mkOption {
      type = types.submodule {
        options = {
          userName = lib.mkOption {
            type = types.str;
            default = "blahajr";
          };
          userEmail = lib.mkOption {
            type = types.str;
            default = "blahja@blahja.me";
          };
        };
      };
      default = {};
    };

    sshAuthorizedKeys = lib.mkOption {
      type = types.listOf types.str;
      default = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILgb6kgahYESBc0D0FXoDx4NIPmS4TdkTEY1XwWDlvMm meow@blahja.me"
      ];
    };

    editor = lib.mkOption {
      type = types.submodule {
        options = {
          default = lib.mkOption {
            type = types.str;
            default = "nvim";
          };
          homeProgram = lib.mkOption {
            type = types.str;
            default = "neovim";
          };
        };
      };
      default = {};
    };

    users = lib.mkOption {
      type = types.attrsOf userModule;
      default = {
        thinkpad = {
          name = "blahja";
          home = "/home/blahja";
        };
        homelab = {
          name = "root";
          home = "/root";
        };
      };
    };

    theme = lib.mkOption {
      type = types.submodule {
        options = {
          gtk = lib.mkOption {
            type = types.submodule {
              options = {
                variant = lib.mkOption {
                  type = types.str;
                  default = "mocha";
                };
                accent = lib.mkOption {
                  type = types.str;
                  default = "mauve";
                };
              };
            };
            default = {};
          };

          colors = lib.mkOption {
            type = types.attrsOf types.str;
            description = "Catppuccin Mocha palette (hex, with #).";
            default = {
              base = "#1e1e2e";
              mantle = "#181825";
              crust = "#11111b";
              text = "#cdd6f4";
              subtext0 = "#a6adc8";
              subtext1 = "#bac2de";
              surface0 = "#313244";
              surface1 = "#45475a";
              surface2 = "#585b70";
              overlay0 = "#6c7086";
              rosewater = "#f5e0dc";
              flamingo = "#f2cdcd";
              pink = "#f5c2e7";
              mauve = "#cba6f7";
              red = "#f38ba8";
              maroon = "#eba0ac";
              peach = "#fab387";
              yellow = "#f9e2af";
              green = "#a6e3a1";
              teal = "#94e2d5";
              sky = "#89dceb";
              blue = "#89b4fa";
              lavender = "#b4befe";
            };
          };
        };
      };
      default = {};
    };
  };
}
