{pkgs, ...}: {
  virtualisation = {
    docker = {
      enable = true;
      rootless = {
        enable = true;
      };
    };

    waydroid.enable = true;
    waydroid.package = pkgs.waydroid-nftables;

    spiceUSBRedirection.enable = true; # Connect USB devices to libvirt VMs, both local and remote.

    libvirtd = {
      # https://nixos.wiki/wiki/Libvirt
      enable = true;
    };
  };

  # Network autostart - `virsh net-autostart default` в терминале
  programs.virt-manager.enable = true; # https://nixos.wiki/wiki/Virt-manager
}
