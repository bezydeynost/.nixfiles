{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [2121];
      checkReversePath = "loose";
      trustedInterfaces = ["throne-tun"];
    };
  };

  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };
}
