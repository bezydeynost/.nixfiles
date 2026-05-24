{pkgs, ...}: {
  programs.zsh.enable = true;

  users.users.bezydeynost = {
    isNormalUser = true;
    uid = 1000;
    description = "bezydeynost";
    extraGroups = ["networkmanager" "wheel" "input" "libvirtd" "storage" "docker" "video" "i2c" "adbusers" "plugdev"];
    shell = pkgs.zsh;
  };
}
