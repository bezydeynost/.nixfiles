{pkgs, ...}: {
  services = {
    gvfs.enable = true; # Mount, trash, and other functionalities for Thunar file manager
    tumbler.enable = true; # Thumbnail support for Thunar file manager
    flatpak.enable = true;
    xserver.enable = true;
    printing.enable = true;
    udisks2.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
    cloudflare-warp.enable = true;
    # logmein-hamachi.enable = true;
    # archisteamfarm = {}; # Фарм карточек стима афк. Просто раскомментить мало, надо настроить
  };

  systemd.services.lactd.enable = true;

  programs = {
    nix-ld = {
      # Имитация файловой системы обычного линукса и пакеты для этого дела
      enable = true;
      libraries = with pkgs; [
        # Для большинства программ
        stdenv.cc.cc
        glib
        gtk3
        cairo
        gdk-pixbuf
        pango
        atk
        at-spi2-atk
        harfbuzz
        libpng
        expat
        libX11
        libXrandr
        libxcb
        zstd

        # Creamlinux
        webkitgtk_4_1
        libsoup_3
        cairo
        gdk-pixbuf
        pango
        atk
        at-spi2-atk
        harfbuzz
        icu
      ];
    };

    appimage = {
      enable = true;
      binfmt = true;
      package = pkgs.appimage-run.override {
        extraPkgs = pkgs:
          with pkgs; [
            libpng
            libpng12
            libepoxy
            pcre2
            double-conversion
            webkitgtk_4_1
            libsoup_3
            zstd
          ];
      };
    };

    thunar = {
      enable = false;
      plugins = with pkgs; [
        thunar-media-tags-plugin # Tagging and renaming features for media files
        thunar-archive-plugin # File context menus for archives
        thunar-volman # Automatic management of removable drives and media
      ];
    };

    xfconf.enable = true; # For Thunar configs
  };

  programs.obs-studio.enableVirtualCamera = true;

  environment.systemPackages = with pkgs; [
    ###############
    ## Some apps ##
    ###############

    quickshell
    awww # Wallpapers
    darktable

    #########
    ## GUI ##
    #########

    flameshot
    # ksnip # Скрин экрана. Аналог - Flameshot
    qbittorrent-enhanced
    bitwarden-desktop # Password manager
    keepassxc
    throne # Vless
    gnome-disk-utility # Диски трогат
    pavucontrol # PulseAudio Volume Control
    brightnessctl # Brightness control for laptop
    crosspipe # Прокидка звука в другие источники pipewire
    gparted # Форматирование дисков
    # haguichi # Frontend hamachi
    localsend # Кидать файлы
    lsfg-vk # Framegen losless scaling
    lsfg-vk-ui # Framegen losless scaling
    pear-desktop # YT-music
    spotify # Spotify
    nicotine-plus # P2P music
    micro # Terminal text editor
    parabolic # Frontend yt-dlp
    qdiskinfo # Disk info
    kdiskmark #
    waypaper # Wallpaper
    zoom-us # Video conferencing
    gnome-calculator # Calculator
    gpu-screen-recorder-gtk # Fast record video
    bazaar # Check Flatpaks
    collector #
    materialgram
    ayugram-desktop
    element-desktop
    tor-browser
    nur.repos.lonerOrz.helium

    #########
    ## KDE ##
    #########

    kdePackages.okular
    kdePackages.kdenlive # Видеоредактор
    kdePackages.discover # Optional: Software center for Flatpaks/firmware updates
    kdePackages.kcalc # Calculator
    kdePackages.kcharselect # Character map
    kdePackages.kcolorchooser # Color picker
    kdePackages.ksystemlog # System log viewer
    kdePackages.sddm-kcm # SDDM configuration module
    kdePackages.kdeconnect-kde
    kdePackages.dolphin
    kdePackages.kservice
    kdiff3 # File/directory comparison tool
    kdePackages.qt6ct
    libsForQt5.qt5ct
    catppuccin-kde
    catppuccin-kvantum
    kdePackages.qtstyleplugin-kvantum
    haruna

    ##############
    ## Terminal ##
    ##############

    openssl
    wget
    curl
    git
    gh
    yt-dlp # Скачивать и смотреть медиа с разных сайтов
    wl-clipboard
    trash-cli
    android-tools # ADB
    adb-sync
    ntfs3g # Для NTFS разделов
    ffmpeg_7 # Обработка видео. Нужен всегда и везде как зависимость
    svt-av1 # Кодек для рендера в av1 на проце
    imagemagick # Обработка изображений. Мб тоже нужен всегда
    vips # В 4 раза быстрее imagemagick?
    tree # Структура файлов в терминале
    gnugrep # Поиск в терминале
    rsync # Синхронизация файлов
    bat # Аналог cat с подсветкой синтаксиса
    xrandr # Управление мониторами
    xdg-utils # Set of command line tools that assist applications with a variety of desktop integration tasks
    playerctl # Управление медиа. Плей/пауза и тд
    mediainfo # Info fow FLAC
    amdgpu_top # Tool to display AMD GPU usage
    btop-rocm # Монитор ресурсов в терминале
    nvtopPackages.amd
    icoextract
    rocmPackages.rocm-smi # Чтоб в btop было gpu
    rocmPackages.rocblas # Для работы hip?
    rocmPackages.hipblas # Для работы hip?
    rocmPackages.clr # Для работы hip?
    rocmPackages.rocm-core
    rocmPackages.rocminfo
    timer # A "sleep" with progress. Таймер на пельмени "timer 5m"
    fzf # Нечёткий поиск
    killall # Убить процессы. Мем, что в стоке не стоит
    libnotify # Вызов оповещений через "notify-send"
    gallery-dl # Качать много картинок с кучи разных сайтов
    ddcutil # Прикол для управление яркости моего моника
    ddcutil-service # Прикол для управление яркости моего моника
    lm_sensors # Сенсоры
    grim
    slurp
    miller # Like awk, sed, cut, join, and sort for data formats such as CSV, TSV, JSON, JSON Lines, and positionally-indexed
    usbutils # lsusb
    f2fs-tools # f2fs filesystem
    exfat # exFAT filesystem
    xwayland-satellite # Для нири
    xwayland # Для нири
    udiskie #
    calf # Для изиефект
    lvm2 # Для изиефект
    lsp-plugins # Для изиефект
    duf # Место
    eza # Replace for ls
    ncdu # Disk usage analyzer
    man # Documentation
    tldr # Documentation
    wev # Event viewer
    ripdrag # Drag and drop
    gpu-screen-recorder #
    microfetch
    nix-melt
    nur.repos.zerozawa.mikusays
    xhost

    ##########
    ## Docs ##
    ##########

    libreoffice-fresh # Редактировать документы
    onlyoffice-desktopeditors
    hunspell # Проверка орфографии для libreoffice
    hunspellDicts.ru_RU # Словарь для проверки орфографии
    hunspellDicts.en_US # Словарь для проверки орфографии
    hunspellDicts.uk_UA # EСловарь для проверки орфографии

    ###################
    ## File managers ##
    ###################

    nautilus # File manager
    yazi # Terminal File manager
    # thunar # GUI file manager
    catfish # File searching (for Thunar)
    ffmpegthumbnailer # A lightweight video thumbnailer

    ##################
    ## File support ##
    ##################

    kdePackages.kimageformats # Image format plugins for Qt 6
    kdePackages.qtimageformats # Plugins for additional image formats: TIFF, MNG, TGA, WBMP
    libsForQt5.qt5.qtimageformats
    kdePackages.qtsvg # SVG support
    kdePackages.karchive # Plugin for Krita and OpenRaster images
    webp-pixbuf-loader # .webp support (what's this?)
    gdk-pixbuf.dev # Library for image loading and manipulation
    libwebp # .webp support
    libavif # AVIF format support
    libheif # HEIF format support
    libgsf # .odf support
    libjxl # JPEG-XL format support
    libraw # RAW format support
    librsvg # Small library to render SVG images to Cairo surfaces
    jxrlib # JPEG XR image support
    poppler # PDF support
    freetype # Font rendering engine
    imath # EXR format support
    openexr # High dynamic-range (HDR) image file format

    ###########
    ## Media ##
    ###########

    tauon # Музыкальный плееер
    deadbeef
    rhythmbox # Музыкальный плееер
    picard # Массовый редактор метаданных музыки
    mousai # Опенсорс шазам. Со временем просит платный api
    mpv # Смотреть видео
    imv # Смотреть картинки
    feh # Нужен в большом количестве софта как зависимость. Может в avif, но криво
    loupe

    ############
    ## Design ##
    ############

    krita # Рисовать
    # blender-hip # 3д графика и рендер видео

    ##################
    ## Productivity ##
    ##################

    obsidian # Заметки

    #########
    ## IDE ##
    #########

    neovim
    vim

    ###########
    ## Icons ##
    ###########

    adwaita-icon-theme
    adwaita-qt
    adwaita-qt6
    libsForQt5.breeze-icons # qt5
    kdePackages.breeze-icons # qt6
    papirus-icon-theme
    material-icons

    ############
    ## Vulkan ##
    ############

    glslang
    spirv-cross
    spirv-headers
    spirv-tools
    vulkan-extension-layer
    vulkan-headers
    vulkan-loader
    vulkan-tools
    vulkan-tools-lunarg
    vulkan-utility-libraries
    vulkan-validation-layers
    vkdisplayinfo
    vk-bootstrap
    dxvk # Чтоб wine игры запускались через vulkan, а не opengl (Direct3D 8/9/10/11)
    vkd3d # Чтоб wine игры запускались через vulkan, а не opengl (Direct3D 12)
    vkd3d-proton
    # vkbasalt # Баф Vulkan для улучшения визуальной графики игр https://github.com/DadSchoorse/vkBasalt

    ###########
    ## Other ##
    ###########

    fontconfig
    zlib
    libva-utils # Проверяет работоспособность VAAPI?
    clinfo # Проверяет работоспособность OpenCL?
    pamixer # PulseAudio cli (громкость редачу)
    # droidcam

    ###########
    ## Govno ##
    ###########

    cargo
    cmake
    go
    python313

    # Protobuf
    protols # LSP
    protobuf
    protoc-gen-go
    protoc-gen-go-grpc

    glib

    v2ray # VPN
    xray # VPN
    sing-box # VPN

    lmstudio # Local AP
    ventoy-full-gtk

    ############
    ## Архивы ##
    ############

    zip # Архивировать
    file-roller # Архиватор от gnome
    unzip # Разархивировать
    unrar # Разархивировать
    gnutar # Для .tar?
    p7zip # Это пакет для 7z?
    bzip2 # .bz2 архивы
    unar #
    peazip #
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-gtk3-1.1.10"
  ];
}
