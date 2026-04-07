{inputs, ...}: {
  imports = [
    inputs.zapret-discord-youtube.nixosModules.default
    /home/falguren/.nixmodules/zapret-list.nix
  ];
  services.zapret-discord-youtube = {
    enable = true;
    configName = "general(ALT9)";
  };

  systemd.services.zapret-discord-youtube.after = ["network.target"];
  systemd.services.zapret-discord-youtube.wants = ["network.target"];
}
