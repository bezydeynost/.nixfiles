{
  config,
  pkgs,
  ...
}: let
  username = "bezydeynost";
in {
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = ["networkmanager" "wheel" "input" "libvirtd" "storage" "docker" "video" "i2c" "adbusers" "plugdev"];
    shell = pkgs.zsh;
    hashedPasswordFile = config.age.secrets."nixos/secrets/password".path;
  };
}
