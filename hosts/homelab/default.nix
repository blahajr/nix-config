{lib, ...}: {
  imports =
    [
      ./identity.nix
      ./network.nix
      ./enabled
      ./system
      ../../modules/system/users.nix
    ]
    ++ lib.optional (builtins.pathExists ./hardware-configuration.nix) ./hardware-configuration.nix;
}
