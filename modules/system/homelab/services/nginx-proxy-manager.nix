{
  config,
  lib,
  ...
}: let
  cfg = config.homelab.nginxProxyManager;
in {
  options.homelab.nginxProxyManager = {
    enable = lib.mkEnableOption "Nginx Proxy Manager";

    dataDir = lib.mkOption {
      type = lib.types.str;
      default = "/var/lib/nginx-proxy-manager";
      description = "Host directory for NPM data and Let's Encrypt certificates.";
    };

    httpPort = lib.mkOption {
      type = lib.types.port;
      default = 80;
    };

    adminPort = lib.mkOption {
      type = lib.types.port;
      default = 81;
      description = "Web admin UI.";
    };

    httpsPort = lib.mkOption {
      type = lib.types.port;
      default = 443;
    };
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = lib.mkAfter [
      cfg.httpPort
      cfg.adminPort
      cfg.httpsPort
    ];

    systemd.tmpfiles.rules = [
      "d ${cfg.dataDir}/data 0755 root root -"
      "d ${cfg.dataDir}/letsencrypt 0755 root root -"
    ];

    virtualisation.oci-containers.containers.nginx-proxy-manager = {
      image = "docker.io/jc21/nginx-proxy-manager:latest";
      autoStart = true;
      ports = [
        "${toString cfg.httpPort}:80/tcp"
        "${toString cfg.adminPort}:81/tcp"
        "${toString cfg.httpsPort}:443/tcp"
      ];
      volumes = [
        "${cfg.dataDir}/data:/data"
        "${cfg.dataDir}/letsencrypt:/etc/letsencrypt"
      ];
    };
  };
}
