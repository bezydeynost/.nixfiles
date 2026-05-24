{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window.padding = {
        x = 5;
        y = 5;
      };
      font = {
        size = 13;
        normal = {
          family = "Liberation Mono";
          style = "Regular";
        };
        bold = {
          family = "Liberation Mono";
          style = "Bold";
        };
        italic = {
          family = "Liberation Mono";
          style = "Italic";
        };
      };
      mouse = {
        hide_when_typing = true;
      };
    };
  };

  home.packages = with pkgs; [
    ueberzugpp
  ];
}
