{pkgs, inputs, ...}: {

  fonts.packages = with pkgs; [
    noto-fonts # Шрифт от гугла, цель которого поддержка всех языков мира
    noto-fonts-cjk-serif # Отображение иероглифов. Версия с засечками
    noto-fonts-cjk-sans # Отображение иероглифов. Версия без засечек
    noto-fonts-color-emoji
    noto-fonts-monochrome-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto
    noto-fonts
    nerd-fonts.symbols-only
    nerd-fonts.caskaydia-mono
    carlito # Совместим с Calibri, разработан как его свободная альтернатива. Без засечек
    terminus_font
    inconsolata
    font-awesome
    liberation_ttf
    dejavu_fonts
    cantarell-fonts
    unifont
    unifont_upper
    times-newer-roman
  ];

  fonts.fontconfig = {
    enable = true;
    antialias = true;
    hinting = {
      enable = true;
      style = "slight"; 
    };
    subpixel = {
      rgba = "rgb";
      lcdfilter = "default"; 
    };
  };
}
