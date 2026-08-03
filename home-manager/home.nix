{config, ...}: {
  imports = [
    ../modules/home-manager/default.nix
  ];

  home = {
    username = "bezydeynost";
    homeDirectory = "/home/bezydeynost";
    stateVersion = "26.05";
    sessionVariables = {
      EDITOR = "nvim";
    };
    shell.enableFishIntegration = true;
  };

  programs.home-manager.enable = true;

  services.easyeffects.enable = true;

  services.home-manager.autoExpire = {
    enable = true;
    frequency = "weekly";
    timestamp = "-30 days";

    store = {
      cleanup = true;
      options = "--delete-older-than 30d";
    };
  };
}
