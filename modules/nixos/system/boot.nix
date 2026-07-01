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
      timeout = 0;
    };

    tmp.cleanOnBoot = true;

    extraModprobeConfig = ''
      options amdgpu ppfeaturemask=0xffffffff
      v4l2loopback exclusive_caps=1 devices=1 video_nr=1 card_label="Virtual Camera"
    '';

    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];

    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      "splash"
    ];
    kernelModules = [
      "v4l2loopback"
      "tun"
    ];
  };

  security.polkit.enable = true;
  systemd.settings.Manager = {
    DefaultTimeoutStopSec = "10s";
  };
}
