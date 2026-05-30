{
  pkgs,
  ...
}: {
  environment.pathsToLink = ["/share/zsh"];

  environment.systemPackages = with pkgs; [
    cachix
    hwdata
    lshw
    pciutils
    polkit
    unar
    dnsutils
    ethtool
    iperf3
    mtr
    nmap
    tcpdump
    traceroute
    whois
    iotop
    lsof
    strace
    sysstat
    bc
    man-pages
    psmisc
    rsync
    tree
    xxd
    yamllint
    zip
    p7zip
  ];
}
