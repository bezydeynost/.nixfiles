{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.zapret-discord-youtube.nixosModules.withTestTools];

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

  services.zapret-discord-youtube = {
    enable = true;
    configName = "general(ALT9)";
    gameFilter = "null";
  };

  systemd.services.zapret-discord-youtube.after = ["network.target"];
  systemd.services.zapret-discord-youtube.wants = ["network.target"];
}
