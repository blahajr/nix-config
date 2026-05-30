{...}: {
  imports = [
    ./minecraft-server.nix
    ./nginx-proxy-manager.nix
    ./adguard.nix
  ];
}
