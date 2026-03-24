{lib, ...}: {
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    #enableZshIntegration = true;

    settings = {
      window-inherit-working-directory = false;
      font-size = lib.mkForce 13;
      font-family = lib.mkForce "Liberation Mono";
      font-family-bold = lib.mkForce "Liberation Mono Bold";
      font-family-italic = lib.mkForce "Liberation Mono Italic";
      font-family-bold-italic = lib.mkForce "Liberation Mono Bold Italic";

      clipboard-read = "allow";
      clipboard-write = "allow";
      quick-terminal-position = "center";
    };
  };
}
