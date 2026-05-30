{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: let
  settings = config.settings;
  host = config.networking.hostName;
  thinkpadUser = settings.users.thinkpad.name;
  homelabUser = settings.users.homelab.name;
in {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit inputs;
      hostName = host;
    };
  };

  users.users = lib.mkMerge [
    (lib.mkIf (host == "thinkpad") {
      ${thinkpadUser} = {
        isNormalUser = true;
        shell = pkgs.zsh;
        openssh.authorizedKeys.keys = settings.sshAuthorizedKeys;
        extraGroups = ["wheel" "networkmanager"];
      };
    })
    (lib.mkIf (host == "homelab") {
      ${homelabUser} = {
        shell = pkgs.zsh;
        openssh.authorizedKeys.keys = settings.sshAuthorizedKeys;
      };
    })
  ];

  home-manager.users = lib.mkMerge [
    (lib.mkIf (host == "thinkpad") {
      ${thinkpadUser} = import ../../home/blahja/thinkpad;
    })
    (lib.mkIf (host == "homelab") {
      ${homelabUser} = import ../../home/root;
    })
  ];
}
