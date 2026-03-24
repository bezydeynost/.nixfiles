{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    # Wiki - https://stylix.danth.me/options/nixos.html
    enable = true;
    enableReleaseChecks = true;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml"; # Если хочешь генерить тему из обоев, то удали эту строку

    #image = config.lib.stylix.pixel "base00"; # Вместо обоев будет заливка фона одним цветом из темы
    #image = /home/falguren/Pictures/Wallpapers/Sunset-Forrest.png; # Если хочешь норм обои, то просто укажи путь до изображения

    #image = pkgs.fetchurl {
    #  url = "https://w.wallhaven.cc/full/je/wallhaven-jewvzy.jpg";
    #  hash = "sha256-UjQnjABGjGslIF0bXIH3B8R6i6E85nJRH7ayXToaYqw=";
    #};

    #colorGeneration = {
    #  polarity = "dark";
    #  scheme = "content";
    #};

    polarity = "dark"; # "light" or "either". Если "either", то он сам определяет что будет красивее

    fonts = {
      sansSerif = {
        name = "Adwaita Sans";
        package = pkgs.adwaita-fonts;
      };
      monospace = {
        name = "JetBrainsMono Nerd Font";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 18; # default = 32
    };

    icons = {
      enable = true;
      dark = "MoreWaita";
      package = pkgs.morewaita-icon-theme;
    };
  };
}
