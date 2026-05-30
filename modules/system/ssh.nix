{config, ...}: let
  host = config.networking.hostName;
in {
  services.openssh = {
    enable = true;

    settings = {
      PermitRootLogin =
        if host == "homelab"
        then "prohibit-password"
        else "no";
      PasswordAuthentication = false;
    };
  };
}
