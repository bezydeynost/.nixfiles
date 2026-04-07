{
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      dns = "none";
    };
    firewall = {
      enable = true;
      checkReversePath = "loose";
      trustedInterfaces = ["throne-tun"];
      allowedTCPPorts = [4747];
      allowedUDPPorts = [4747];
    };
    nameservers = ["1.1.1.1"];
  };
}
