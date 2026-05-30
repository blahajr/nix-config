{...}: {
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [22];
    trustedInterfaces = ["tailscale0"];
  };
}
