{ config, lib, pkgs, ... }: {
  hardware = { # Параметры для 24.05 и unstable могут сильно отличаться
    /*amdgpu = {
      opencl.enable = true; # Enable OpenCL support using ROCM runtime library.
      # amdvlk = { # Гавно лаганое, лучше radv юзать (radeon vulkan)
      #   enable = true; # Enable AMDVLK Vulkan driver.
      #   support32Bit.enable = true; # Enable 32-bit driver support.
      #   supportExperimental.enable = true; # Enable Experimental features support.
      #   # settings = {}; # Runtime settings for AMDVLK to be configured /etc/amd/amdVulkanSettings.cfg.
      # };
    };*/

    amdgpu.overdrive.enable = true;

    i2c.enable = true;

    graphics = { # hardware.opengl переименован в hardware.graphics в unstable ветке
      enable = true;
      enable32Bit = true; # install 32-bit drivers for 32-bit applications (such as Wine).
      extraPackages = with pkgs; [
        libva # VAAPI (Video Acceleration API)
        rocmPackages.clr.icd # OpenCL
      ];
    };

    # opentabletdriver.enable = true; # Установить, настроить и добавить в автозапуск otd

    # keyboard.qmk.enable = true; # Еnable non-root access to the firmware of QMK keyboards.

    # Список пакетов-драйверов, которые будут активированы лишь при нахождении подходящего оборудования
    # firmware = with pkgs; [];

    # Мало раскомментить. Надо настроить при необходимости
    # fancontrol = {};

    # В стоке false. Не понял зачем надо, сохранил из интереса
    # enableAllFirmware = true;

    # Whether to enable firmware with a license allowing redistribution.
    # enableRedistributableFirmware = true;

    # Разные способы управлять яркостью экрана и подсветки для юзеров в группе video
    # Подробности тут https://wiki.archlinux.org/title/Backlight#Backlight_utilities
    # brillo.enable = true;
    # acpilight.enable = true;

  };

  # HIP
  # Most software has the HIP libraries hard-coded. You can work around it on NixOS by using:
  # systemd.tmpfiles.rules = [ # Legacy
  #   "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  # ];
  systemd.tmpfiles.rules = let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [
        rocblas
        hipblas
        clr
      ];
    }; in [
    "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  ];


  # Для AMD существует два драйвера Vulkan
  # Один официальный от AMD - amdvlk
  # Второй начат сообществом и сейчас поддерживается Valve - radv
  # В разных ситуациях разные драйверы будут лучше работать
  # В некоторых играх лучше работает radv, в некоторых amdvlk
  # Штука ниже не обязательна для работы radv, но я сохранил
  # environment.variables.AMD_VULKAN_ICD = "RADV";

  environment.systemPackages = with pkgs; [
    lact
  ];

  ## LACT daemon ##
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];

  /*systemd.services.lact = {
    description = "AMDGPU Control Daemon";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    enable = true;
  };*/
}
