{ config, pkgs, curversion, inputs, ... }:

{
  imports = [
    #./wm-de
    /etc/nixos/hardware-configuration.nix
    ./hardware
    ./network
    ./software
    ./system
    ./pkgs.nix
    ./user.nix
  ];

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      warn-dirty = false;
    };

    optimise = {
      automatic = true;
      dates = "weekly";
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  }; 
 
  programs.dconf.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
	#vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	gnome-tweaks

	(writeShellScriptBin "npath" ''
	if [ -z "$1" ]; then
	  	echo "Usage: npath <program>"
		exit 1
	fi
	readlink -f $(which $1)
	'')
  ];

  system.stateVersion = "26.05";

  services.displayManager.gdm.enable = true;
  programs.niri.enable = true;
  services.desktopManager.gnome.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
      #xdg-desktop-portal-kde
    ];

    config = {
      niri = {
        default = [
          "gnome"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Access" = [
          "gtk"
        ];
        "org.freedesktop.impl.portal.Notification" = [
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
    };
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "com.mitchellh.ghostty.desktop"
      ];
    };
  };
}
