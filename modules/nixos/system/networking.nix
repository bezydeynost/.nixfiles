{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nftables.enable = true;
    nameservers = ["1.1.1.1" "1.0.0.1"];
    firewall.enable = false;
  };

  programs.throne = {
    enable = true;
    tunMode = {
      enable = true;
      setuid = true;
    };
  };

  services.zapret-discord-youtube = {
    enable = true;
    interface = "any";
    strategy = "general_fake_tls_auto_alt.bat";
    gameFilterTcp = false;
    gameFilterUdp = false;
  };

  systemd.services.zapret-discord-youtube.after = ["network.target"];
  systemd.services.zapret-discord-youtube.wants = ["network.target"];
}
