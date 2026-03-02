{
  config,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
      };
      efi.canTouchEfiVariables = true;
      timeout = 2;
    };

    tmp.cleanOnBoot = true;

    initrd.kernelModules = ["amdgpu"]; # Мб не обязательно

    extraModprobeConfig = ''options amdgpu ppfeaturemask=0xffffffff v4l2loopback exclusive_caps=1 devices=1 video_nr=1 card_label="OBS Cam"'';

    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];

    kernelPackages = pkgs.linuxPackages_lqx;
    kernelParams = [
      "quiet"
      "splash"
    ];
    kernelModules = [
      "v4l2loopback"
      "amdgpu"
    ];
  };
  security.polkit.enable = true;
  systemd.settings.Manager = {
    DefaultTimeoutStopSec = "10s";
  };
}
