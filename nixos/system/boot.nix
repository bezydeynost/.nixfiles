{ config, pkgs, ...}: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
      };
      efi.canTouchEfiVariables = true;
      timeout = 2;
    };

    /*loader = {
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev"; # nodev позволяет не устанавливать grub в конкретное место, но видеть его ui
      };
      efi.canTouchEfiVariables = true;
    };*/

    tmp.cleanOnBoot = true;

    initrd.kernelModules = [ "amdgpu" ]; # Мб не обязательно

    extraModprobeConfig = ''options amdgpu ppfeaturemask=0xffffffff v4l2loopback exclusive_caps=1 card_label="Virtual Camera" video_nr=9'';

    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];

    #kernelPackages = pkgs.linuxPackages_zen;
    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "quiet"
      "splash"
    ];

    kernelModules = [
      "v4l2loopback"
      "amdgpu"
    ];
  };
}
