{
  inputs,
  pkgs,
  ...
}: let
  username = "bezydeynost";
in {
  imports = [
    ./hardware-configuration.nix
    ../modules/nixos/default.nix
    ./packages.nix
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

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.millennium.overlays.default
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.stable-packages
    ];
  };

  security.polkit = {
    enable = true;
  };

  hardware.bluetooth = {
    enable = true;
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      isNormalUser = true;
      description = username;
      extraGroups = ["networkmanager" "wheel" "input" "libvirtd" "storage" "docker" "video" "i2c" "adbusers" "plugdev"];
    };
  };

  fonts.fontconfig = {
    enable = true;
    antialias = true;
    hinting = {
      enable = true;
      style = "slight";
    };
    subpixel = {
      rgba = "rgb";
    };
  };

  services.scx = {
    enable = true;
    package = pkgs.scx.rustscheds;
    scheduler = "scx_cosmos";
    ## Gaming mode for scx_cosmos
    extraArgs = [
      "-c"
      "0"
      "-p"
      "0"
    ];
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 20;
    priority = 100;
  };

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  system.stateVersion = "26.11";
}
