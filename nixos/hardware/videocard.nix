{pkgs, ...}: {
  hardware = {
    amdgpu.overdrive.enable = true;
    i2c.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true; # install 32-bit drivers for 32-bit applications (such as Wine).
      extraPackages = with pkgs; [
        libva # VAAPI (Video Acceleration API)
        rocmPackages.clr.icd # OpenCL
      ];
    };

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
  systemd.tmpfiles.rules = let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [
        rocblas
        hipblas
        clr
      ];
    };
  in [
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
  systemd.packages = with pkgs; [lact];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
}
