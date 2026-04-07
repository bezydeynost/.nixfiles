{
  config,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        editor = true;
      };
      efi.canTouchEfiVariables = true;
      timeout = 3;
    };

    tmp.cleanOnBoot = true;

    extraModprobeConfig = ''options amdgpu ppfeaturemask=0xffffffff v4l2loopback exclusive_caps=1 devices=1 video_nr=1 card_label="OBS Cam"'';

    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];

    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "quiet"
      "splash"
    ];
    kernelModules = [
      "v4l2loopback"
    ];
  };

  services.displayManager.gdm.enable = true;

  security.polkit.enable = true;
  systemd.settings.Manager = {
    DefaultTimeoutStopSec = "10s";
  };
}
