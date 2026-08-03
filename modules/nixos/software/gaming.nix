{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [inputs.millennium.overlays.default];
  programs = {
    steam = {
      enable = true;
      protontricks.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      fontPackages = with pkgs; [liberation_ttf];
      package = pkgs.millennium-steam;
    };
    gamescope.enable = true;
  };

  services.flatpak.packages = [
    "ru.linux_gaming.PortProton"
  ];

  environment.systemPackages = with pkgs; [
    steam-run
    mangohud
    wineWow64Packages.stable
    winetricks
    protontricks
    goverlay
    faugus-launcher
    protonplus
  ];
}
