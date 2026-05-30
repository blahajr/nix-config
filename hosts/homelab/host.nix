{
  ...
}: {
  nixpkgs.hostPlatform = "x86_64-linux";

  networking.hostName = "homelab";
  system.stateVersion = "25.11";
}
