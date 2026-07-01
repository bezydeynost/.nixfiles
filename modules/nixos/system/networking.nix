{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.zapret-discord-youtube.nixosModules.default
  ];

  environment.systemPackages = [
    inputs.tg-ws-proxy.packages.${pkgs.system}.default
  ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [2121];
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
    listGeneral = [];
  };

  systemd.services.zapret-discord-youtube.after = ["network.target"];
  systemd.services.zapret-discord-youtube.wants = ["network.target"];

  systemd.services.tg-ws-proxy = {
    description = "Telegram WS Proxy";
    wantedBy = ["multi-user.target"];
    after = ["network.target"];
    serviceConfig = {
      ExecStart = "${inputs.tg-ws-proxy.packages.${pkgs.system}.default}/bin/tg-ws-proxy --port 8443 --fake-tls-domain 4pda.to --secret 11111111111111111111111111111111";
      Restart = "on-failure";
      DynamicUser = true;
    };
  };
}
