# Управление системной темой
{ pkgs, config, ... }: {

  stylix = { # Wiki - https://stylix.danth.me/options/nixos.html

    enable = true;
    autoEnable = true;

    polarity = "dark"; # "light" or "either". Если "either", то он сам определяет что будет красивее
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml"; # Если хочешь генерить тему из обоев, то удали эту строку
    # image = config.lib.stylix.pixel "base00"; # Вместо обоев будет заливка фона одним цветом из темы
    #image = /home/falguren/Pictures/Wallpapers/Sunset-Forrest.png; # Если хочешь норм обои, то просто укажи путь до изображения

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 18; # default = 32
    };

    fonts = {

      # Ширина символов одинаковая
      monospace = { # default = DejaVu Sans Mono
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMonoNL Nerd Font Mono";
      };

      emoji = { # default = Noto Color Emoji
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      # Без засечек
      sansSerif = { # default = DejaVu Sans
        package = pkgs.nerd-fonts.noto;
        name = "NotoSans Nerd Font";
      }; 

      # С засечками
      serif = { # default = DejaVu Serif
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
        # package = pkgs.noto-fonts;
        # name = "Noto Serif";
      };
    };
  };
}
