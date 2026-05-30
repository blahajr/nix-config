{...}: {
  imports = [
    ./boot.nix
    ../../../modules/system/core.nix
    ../../../modules/system/packages.nix
    ../../../modules/system/ssh.nix
    ./docker.nix
    ./services
    ./firewall.nix
    ../../../modules/system/security.nix
  ];
}
