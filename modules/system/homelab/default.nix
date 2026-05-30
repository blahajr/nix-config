{...}: {
  imports = [
    ../core.nix
    ../packages.nix
    ../ssh.nix
    ./docker.nix
    ./services
    ./network.nix
    ../security.nix
  ];
}
