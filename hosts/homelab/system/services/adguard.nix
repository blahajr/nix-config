{
  config,
  lib,
  ...
}: let
  cfg = config.homelab.adguard;
in {
  options.homelab.adguard = {
    enable = lib.mkEnableOption "AdGuard Home ";

    dataDir = lib.mkOption {
      type = lib.types.str;
      default = "/var/lib/adguard";
      description = "Host directory for AdGuard work and configuration.";
    };

    dnsPort = lib.mkOption {
      type = lib.types.port;
      default = 53;
    };

    adminPort = lib.mkOption {
      type = lib.types.port;
      default = 3000;
      description = "Initial setup / admin UI.";
    };
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = lib.mkAfter [
      cfg.dnsPort
      cfg.adminPort
    ];
    networking.firewall.allowedUDPPorts = lib.mkAfter [cfg.dnsPort];

    systemd.tmpfiles.rules = [
      "d ${cfg.dataDir}/work 0755 root root -"
      "d ${cfg.dataDir}/conf 0755 root root -"
    ];

    virtualisation.oci-containers.containers.adguard = {
      image = "docker.io/adguard/adguardhome:latest";
      autoStart = true;
      ports = [
        "${toString cfg.dnsPort}:53/tcp"
        "${toString cfg.dnsPort}:53/udp"
        "${toString cfg.adminPort}:3000/tcp"
      ];
      volumes = [
        "${cfg.dataDir}/work:/opt/adguardhome/work"
        "${cfg.dataDir}/conf:/opt/adguardhome/conf"
      ];
    };
  };
}
