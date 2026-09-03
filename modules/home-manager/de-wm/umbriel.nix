{inputs, ...}: {
  imports = [
    inputs.umbriel.homeModules.default
  ];

  programs.umbriel = {
    enable = true;
    settings = {
      general = {
        autostart = [
          "noctalia"
        ];
        mod_key = "Super";
        xwayland = true;
        show_cheatsheet = true;
      };

      layout = {
        gap = 8;
      };

      input.keyboard = {
        layout = "us,ru";
        options = "grp:caps_toggle";
      };

      keybinds = {
        "Mod+Return" = "spawn:foot";
        "Mod+Q" = "window-close";
        "Mod+X" = "overview-toggle";
        "Mod+1" = "workspace-switch:1";
        "Mod+2" = "workspace-switch:2";
        "Mod+3" = "workspace-switch:3";
        "Mod+4" = "workspace-switch:4";
        "Mod+5" = "workspace-switch:5";
        "Mod" = "spawn:noctalia msg panel-toggle launcher";
      };
    };
  };
}
