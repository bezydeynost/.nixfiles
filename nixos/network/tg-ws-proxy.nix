{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    inputs.tg-ws-proxy.packages.${pkgs.system}.default
  ];

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
