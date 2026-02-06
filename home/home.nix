{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./apps
    ./shell
    ./de-wm
    ./stylix.nix
  ];

  programs.home-manager.enable = true;

  services.easyeffects.enable = true;

  services.rescrobbled.enable = true;

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
    username = "falguren";
    homeDirectory = "/home/falguren";
    stateVersion = "25.11";

    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "ghostty";
      TERM = "ghostty";
    };
  };
  xdg.userDirs = { 
	enable = true;
	createDirectories = true;
	desktop = "${config.home.homeDirectory}/Desktop";
	documents = "${config.home.homeDirectory}/Documents";
	download = "${config.home.homeDirectory}/Downloads";
	music = "${config.home.homeDirectory}/Music";
	pictures = "${config.home.homeDirectory}/Pictures";
	videos = "${config.home.homeDirectory}/Videos";
		extraConfig = {
		XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
		};
	};

#  gtk = lib.mkIf (pkgs.stdenv.hostPlatform.isLinux) {
#    # enable = true;
#    iconTheme = {
#      name = "Papirus-Dark"; # Имя каталога в /usr/share/icons/
#      # package = pkgs.papirus-icon-theme; # Пакет иконок
#    };
#  };
}
