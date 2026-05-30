{
  config,
  lib,
  ...
}: let
  cfg = config.homelab.minecraftServer;
in {
  options.homelab.minecraftServer = {
    enable = lib.mkEnableOption "Minecraft server";

    port = lib.mkOption {
      type = lib.types.port;
      default = 25565;
      description = "port.";
    };

    dataDir = lib.mkOption {
      type = lib.types.str;
      default = "/var/lib/minecraft";
      description = "Host path mounted as /data in the container (world, configs, mods).";
    };

    memory = lib.mkOption {
      type = lib.types.str;
      default = "2G";
      description = "JVM heap passed as MEMORY to the container.";
    };

    type = lib.mkOption {
      type = lib.types.str;
      default = "PAPER";
      description = "Server flavor: VANILLA, PAPER, SPIGOT, FABRIC, FORGE, etc.";
    };

    version = lib.mkOption {
      type = lib.types.str;
      default = "LATEST";
      description = "Minecraft version or LATEST.";
    };

    extraEnv = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {};
      description = "Extra environment variables for itzg/minecraft-server.";
    };
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = lib.mkAfter [cfg.port];

    systemd.tmpfiles.rules = [
      "d ${cfg.dataDir} 0755 root root -"
    ];

    virtualisation.oci-containers.containers.minecraft = {
      image = "docker.io/itzg/minecraft-server:latest";
      autoStart = true;
      ports = ["${toString cfg.port}:25565/tcp"];
      volumes = ["${cfg.dataDir}:/data"];
      environment =
        {
          EULA = "TRUE";
          TYPE = cfg.type;
          VERSION = cfg.version;
          MEMORY = cfg.memory;
          MOTD = "homelab";
          DIFFICULTY = "normal";
          MAX_PLAYERS = "10";
          VIEW_DISTANCE = "10";
          SPAWN_PROTECTION = "0";
        }
        // cfg.extraEnv;
    };
  };
}
