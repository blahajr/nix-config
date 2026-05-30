{
  lib,
  ...
}: {
  networking = {
    useNetworkd = true;
    useDHCP = lib.mkForce false;
    networkmanager.enable = lib.mkForce false;
  };

  systemd.network.networks."50-static" = {
    matchConfig.Name = "en*";
    networkConfig.DHCP = "no";
    address = [
      {
        Address = "192.168.1.50/24";
      }
    ];
    routes = [
      {
        Gateway = "192.168.1.254";
      }
    ];
    networkConfig.DNS = ["192.168.1.254" "1.1.1.1"];
  };
}
