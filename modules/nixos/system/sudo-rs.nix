{
  security = {
    sudo.enable = false;
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = true;

      extraRules = [
        {
          users = ["bezydeynost"];
          commands = [
            {
              command = "/run/current-system/sw/bin/nixos-rebuild";
              options = ["NOPASSWD"];
            }
            {
              command = "/run/current-system/sw/bin/nix";
              options = ["NOPASSWD"];
            }
            {
              command = "/run/current-system/sw/bin/nix-collect0garbage";
              options = ["NOPASSWD"];
            }
          ];
        }
      ];
    };
  };
}
