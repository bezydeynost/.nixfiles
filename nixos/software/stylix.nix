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
    enableReleaseChecks = false;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    polarity = "dark";

    fonts = {
      sansSerif = {
        name = "Adwaita Sans";
        package = pkgs.adwaita-fonts;
      };
      serif = {
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
      size = 16; # default = 32
    };

    icons = {
      enable = true;
      dark = "Colloid";
      package = pkgs.colloid-icon-theme;
    };

    targets = {
      gtk.enable = true;
    };
  };
}
