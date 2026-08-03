{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.zapret-discord-youtube.nixosModules.withTestTools];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nameservers = ["1.1.1.1" "1.0.0.1"];
    firewall = {
      enable = true;
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
