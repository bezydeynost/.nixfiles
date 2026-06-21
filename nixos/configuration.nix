{
  imports = [
    /etc/nixos/hardware-configuration.nix
    /etc/nixos/happ-nixos/happ-module.nix
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
      trusted-users = ["root"];
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

  environment.sessionVariables = {
    TERMINAL = "foot";
  };

  environment.pathsToLink = ["/share/zsh"];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "x86_64-linux";

  system.stateVersion = "26.11";
}
