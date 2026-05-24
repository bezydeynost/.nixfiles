{config, ...}: {
  imports = [
    ./apps
    ./shell
    #./de-wm
  ];

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

  home = {
    username = "bezydeynost";
    homeDirectory = "/home/bezydeynost";
    stateVersion = "25.11";
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  xdg.configFile = {
    "niri".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nixfiles/config/niri";

    "fastfetch".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nixfiles/config/fastfetch";
  };
}
