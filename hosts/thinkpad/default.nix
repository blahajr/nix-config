{
  lib,
  ...
}: {
  imports =
    [
      ./host.nix
      ./features
      ../../modules/system/thinkpad
      ../../modules/system/users.nix
    ]
    ++ lib.optional (builtins.pathExists ./hardware-configuration.nix) ./hardware-configuration.nix;
}
