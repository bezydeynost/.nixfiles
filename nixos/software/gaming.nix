{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      protontricks.enable = true; # Running Winetricks commands for Proton-enabled games.
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      extraCompatPackages = with pkgs.nur.repos.mio; [
        proton-cachyos_x86_64_v3
        proton-ge-custom
      ];
    };
    # Оптимизация для игр. https://github.com/FeralInteractive/gamemode
    gamemode = {
      enable = true;
      enableRenice = true;
      settings.general = {
        desiredgov = "performance";
        renice = 10;
      };
    };
    # https://github.com/ValveSoftware/gamescope
    # Подробносни тут https://ventureo.codeberg.page/source/linux-gaming.html#gamescope
    gamescope.enable = true;
  };

  services.flatpak.packages = [
    "ru.linux_gaming.PortProton"
  ];

  environment.systemPackages = with pkgs; [
    steam-run # На всякий случай
    mangohud # Фпс и нагрузку на пк показывает в играх
    #wineWow64Packages.stableFull # support both 32- and 64-bit applications
    wineWow64Packages.stable #
    winetricks # winetricks (all versions)
    protontricks # Running Winetricks commands for Proton-enabled games
    goverlay #
    lutris # Games launcher
    faugus-launcher # Запускать игры
    protonplus # Download proton to Steam Lutris etc
    ryubing
  ];
}
