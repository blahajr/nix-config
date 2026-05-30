{
  ...
}: {
  services.fail2ban = {
    enable = true;
    bantime = "1h";
    maxretry = 5;
    jails.DEFAULT.settings.findtime = "10m";
    jails.sshd = {
      enabled = true;
      settings = {
        maxretry = 5;
        findtime = "10m";
        bantime = "1h";
      };
    };
  };
}
