{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./de-wm
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
      trusted-users = ["root" "falguren"];
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

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
