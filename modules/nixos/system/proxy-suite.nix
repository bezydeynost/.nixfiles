{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.proxy-suite.nixosModules.default
  ];
  services.proxy-suite = {
    enable = true;

    tgWsProxy = {
      enable = true;
      port = 8443;
      secretFile = config.age.secrets."nixos/secrets/tg-ws-proxy".path;
      fakeTlsDomain = "4pda.to";
    };

    zapret = {
      enable = true;
      configName = "general(ALT9)";
      gameFilter = "all";
    };
  };
}
