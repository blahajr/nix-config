{
  lib,
  ...
}: {
  imports =
    [
      ./host.nix
      ./network.nix
      ./features
      ../../modules/system/homelab
      ../../modules/system/users.nix
    ]
    ++ lib.optional (builtins.pathExists ./hardware-configuration.nix) ./hardware-configuration.nix;
}
