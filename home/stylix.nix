{ pkgs, ... }: {
  imports = [
    ../nixos/software/stylix.nix
  ];

  stylix = { # Выключить стили у конкретного таргета походу можно лишь в home-manager
    targets = {
      vscode.enable = false; # Руками ставлю. Не нравится stylix вариант
      firefox.enable = false; # Руками ставлю и бекаплю каталог браузера
      zen-browser.profileNames = [ "default" ];
      qt.platform = "qtct";
    };
     icons = {
       enable = true;
       #package = papirus-icon-theme;
       package = pkgs.rose-pine-icon-theme;
       dark = "rose-pine";
     };
  };
}
