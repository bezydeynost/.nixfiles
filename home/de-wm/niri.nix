{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = with inputs.niri.homeModules; [
    niri
    stylix
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;

    settings = {
      prefer-no-csd = true;
      screenshot-path = "~/Pictures/Screenshots/Screenshot %d-%m-%y %H-%M-%S.png";

      ## Cursor
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 24;
        hide-when-typing = true;
      };

      environment = {
        DISPLAY = ":0";
        XDG_CURRENT_DESKTOP = "niri";
        XDG_SESSION_TYPE = "wayland";
        QT_QPA_PLATFORM = "wayland";
        QT_QPA_PLATFORMTHEME = "gtk3";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
      };

      spawn-at-startup = [
        {command = ["dms" "run"];}
        {command = ["/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"];}
        {command = ["/usr/lib/xdg-desktop-portal-gnome"];}
        {command = ["flameshot"];}
        {command = ["bash" "-c" "wl-paste --watch cliphist store &"];}
        {command = ["kbuildsycoca6" "--noincremental"];}
        {command = ["easyeffects"];}
        {argv = ["materialgram"];}
        {argv = ["zen-beta"];}
      ];

      config-notification.disable-failed = true;

      hotkey-overlay.skip-at-startup = true;

      input = {
        keyboard = {
          xkb = {
            layout = "us,ru,ua";
            options = "grp:caps_toggle";
          };
          numlock = true;
        };
        mouse = {
          accel-speed = -0.4;
          accel-profile = "flat";
          scroll-method = "on-button-down";
          scroll-button = 276;
          scroll-factor = 2.5;
        };
        touchpad.enable = false;
        focus-follows-mouse.enable = true;
        focus-follows-mouse.max-scroll-amount = "0%";
      };

      outputs = {
        "DP-1" = {
          mode = {
            width = 2560;
            height = 1440;
            refresh = 180.0;
          };
          scale = 1.0;
          focus-at-startup = true;
          position = {
            x = 0;
            y = 0;
          };
        };
        "HDMI-A-1" = {
          enable = false;
          mode = {
            width = 1920;
            height = 1080;
            refresh = 60.0;
          };
          scale = 1.0;
          position = {
            x = -1440;
            y = 0;
          };
        };
      };

      workspaces = {
        "browser".open-on-output = "DP-1";
        "chat".open-on-output = "DP-1";
        "lounge".open-on-output = "DP-1";
      };

      layout = {
        gaps = 10;
        always-center-single-column = true;
        background-color = "transparent";

        default-column-width.proportion = 0.5;
        focus-ring.enable = false;
        border.enable = false;

        preset-column-widths = [
          {proportion = 0.33333;}
          {proportion = 0.5;}
          {proportion = 0.66667;}
          {proportion = 0.9;}
          {proportion = 1.0;}
        ];

        preset-window-heights = [
          {proportion = 0.33333;}
          {proportion = 0.5;}
          {proportion = 0.66667;}
        ];
      };

      overview = {
        backdrop-color = "#1f1f1f";
        zoom = 0.25;
      };

      gestures.hot-corners.enable = false;

      debug.honor-xdg-activation-with-invalid-serial = [];

      animations = {
        slowdown = 1.4;
        workspace-switch.kind.spring = {
          damping-ratio = 1.15;
          stiffness = 600;
          epsilon = 0.0001;
        };
        window-open.kind.easing = {
          duration-ms = 200;
          curve = "ease-out-cubic";
        };
        window-close.kind.easing = {
          duration-ms = 200;
          curve = "ease-out-quad";
        };
        horizontal-view-movement.kind.spring = {
          damping-ratio = 1.0;
          stiffness = 600;
          epsilon = 0.0001;
        };
        window-movement.kind.spring = {
          damping-ratio = 1.15;
          stiffness = 600;
          epsilon = 0.0001;
        };
        window-resize.kind.spring = {
          damping-ratio = 1.15;
          stiffness = 600;
          epsilon = 0.0001;
        };
        config-notification-open-close.kind.spring = {
          damping-ratio = 0.85;
          stiffness = 700;
          epsilon = 0.001;
        };
        screenshot-ui-open.kind.easing = {
          duration-ms = 170;
          curve = "ease-out-cubic";
        };
        overview-open-close.kind.spring = {
          damping-ratio = 1.0;
          stiffness = 800;
          epsilon = 0.0001;
        };
      };

      window-rules = [
        # Browser rules
        {
          matches = [
            {
              app-id = "zen-beta$";
              title = "^Картинка в картинке$";
            }
            {title = "^Picture-in-Picture$";}
          ];
          open-floating = true;
          default-floating-position = {
            x = 32.0;
            y = 32.0;
            relative-to = "top-right";
          };
          open-focused = false;
        }
        {
          matches = [
            {
              app-id = "firefox$";
              title = "^Picture-in-Picture$";
            }
          ];
          open-floating = true;
        }
        {
          matches = [{app-id = "firefox";} {app-id = "zen-beta";}];
          open-maximized = true;
          open-on-workspace = "browser";
        }
        # Chat rules
        {
          matches = [{app-id = "discord";} {app-id = "equibop";}];
          open-maximized = true;
          open-on-workspace = "chat";
        }
        {
          matches = [{app-id = "com.ayugram.desktop";} {app-id = "io.github.kukuruzka165.materialgram";}];
          open-maximized = true;
          open-on-workspace = "chat";
        }
        # Lounge
        {
          matches = [{app-id = "com.github.th_ch.youtube_music";} {app-id = "spotify";}];
          open-maximized = true;
          open-on-workspace = "lounge";
        }
        # Etc
        {
          matches = [{app-id = "thunar";} {app-id = "org.gnome.Nautilus";} {app-id = "^PortProton$";} {app-id = "^org.kde.dolphin$";}];
          open-floating = true;
          default-column-width.fixed = 1300;
          default-window-height.fixed = 1100;
        }
        {
          matches = [{app-id = "Alacritty";} {app-id = "kitty";}];
          draw-border-with-background = false;
        }
        {
          matches = [{app-id = "steam";}];
          open-maximized = true;
        }
        {
          matches = [
            {
              app-id = "steam";
              title = "^notificationtoasts_\\d+_desktop$";
            }
          ];
          default-floating-position = {
            x = 10.0;
            y = 10.0;
            relative-to = "bottom-right";
          };
          open-focused = false;
        }
        {
          matches = [{app-id = "^swaync-notification-window$";} {is-focused = true;}];
          open-focused = false;
        }
        {
          geometry-corner-radius = {
            top-left = 12.0;
            top-right = 12.0;
            bottom-left = 12.0;
            bottom-right = 12.0;
          };
          clip-to-geometry = true;
        }
        {
          matches = [{app-id = "org.gnome.Calculator";}];
          default-column-width.fixed = 4;
          default-window-height.fixed = 4;
          open-floating = true;
        }
        {
          matches = [{app-id = "org.quickshell$";}];
          open-floating = true;
        }
      ];

      layer-rules = [
        {
          matches = [{namespace = "awww-daemon";} {namespace = "^quickshell$";}];
          place-within-backdrop = true;
        }
      ];

      binds = {
        # === System & Overview ===
        "Mod+X" = {
          repeat = false;
          action.toggle-overview = [];
        };
        "Mod+MouseBack" = {
          repeat = false;
          action.toggle-overview = [];
        };
        "Mod+Shift+Slash".action.show-hotkey-overlay = [];
        "Mod+E" = {
          hotkey-overlay.title = "File Manager: Dolphin";
          action.spawn = "dolphin";
        };
        "Mod+Shift+E" = {
          hotkey-overlay.title = "File Manager: Nautilus";
          action.spawn = "nautilus";
        };
        "Mod+W" = {
          hotkey-overlay.title = "File Manager: Yazi";
          action.spawn = ["ghostty" "-e" "yazi"];
        };
        "Mod+Shift+Home" = {
          hotkey-overlay.title = "Hide/Show Bar";
          action.spawn = ["dms" "ipc" "call" "bar" "toggle" "name" "Main Bar"];
        };
        "Mod+Shift+Insert" = {
          hotkey-overlay.title = "LockScreen";
          action.spawn = ["dms" "ipc" "call" "lock" "lock"];
        };

        # === Application Launchers ===
        "Mod+Return" = {
          hotkey-overlay.title = "Open Ghostty";
          action.spawn = "ghostty";
        };
        "Mod+T" = {
          hotkey-overlay.title = "Open Ghostty";
          action.spawn = "ghostty";
        };
        "Mod+Shift+Return" = {
          hotkey-overlay.title = "Open Kitty";
          action.spawn = "kitty";
        };
        "Mod+D" = {
          hotkey-overlay.title = "Application Launcher";
          action.spawn = ["dms" "ipc" "call" "spotlight" "toggle"];
        };
        "Mod+V" = {
          hotkey-overlay.title = "Clipboard Manager";
          repeat = false;
          action.spawn = ["dms" "ipc" "call" "clipboard" "toggle"];
        };
        "Mod+Comma" = {
          hotkey-overlay.title = "Settings";
          action.spawn = ["dms" "ipc" "call" "settings" "focusOrToggle"];
        };
        "Mod+N" = {
          hotkey-overlay.title = "Notifications History";
          action.spawn = ["dms" "ipc" "call" "notifications" "open"];
        };
        "Mod+M" = {
          hotkey-overlay.title = "Task Manager";
          action.spawn = ["dms" "ipc" "call" "processlist" "focusOrToggle"];
        };

        # === Other Apps ===
        "Mod+Shift+C".action.spawn = ["dms" "ipc" "call" "color-picker" "toggle"];
        "Mod+Ctrl+P".action.spawn = ["dms" "ipc" "call" "dankdash" "wallpaper"];

        # === Security ===
        "Mod+Ctrl+Delete".action.quit = [];
        "Mod+Shift+Delete".action.spawn = ["dms" "ipc" "call" "powermenu" "toggle"];

        # === Audio Controls ===
        "XF86AudioRaiseVolume" = {
          allow-when-locked = true;
          action.spawn = ["dms" "ipc" "call" "audio" "increment" "5"];
        };
        "XF86AudioLowerVolume" = {
          allow-when-locked = true;
          action.spawn = ["dms" "ipc" "call" "audio" "decrement" "5"];
        };
        "XF86AudioMute" = {
          allow-when-locked = true;
          action.spawn = ["dms" "ipc" "call" "audio" "mute"];
        };
        "XF86AudioPlay" = {
          allow-when-locked = true;
          action.spawn = ["dms" "ipc" "call" "mpris" "playPause"];
        };
        "XF86AudioNext" = {
          allow-when-locked = true;
          action.spawn = ["dms" "ipc" "call" "mpris" "next"];
        };
        "XF86AudioPrev" = {
          allow-when-locked = true;
          action.spawn = ["dms" "ipc" "call" "mpris" "previous"];
        };

        # === Brightness Controls ===
        "XF86MonBrightnessUp" = {
          allow-when-locked = true;
          action.spawn = ["dms" "ipc" "call" "brightness" "increment" "5" ""];
        };
        "XF86MonBrightnessDown" = {
          allow-when-locked = true;
          action.spawn = ["dms" "ipc" "call" "brightness" "decrement" "5" ""];
        };

        # === Window Management ===
        "Mod+Shift+Q" = {
          repeat = false;
          action.close-window = [];
        };
        "Mod+Shift+Space".action.toggle-window-floating = [];
        "Mod+MouseForward".action.toggle-window-floating = [];
        "Mod+Shift+F".action.fullscreen-window = [];

        # === Focus Navigation ===
        "Mod+Left".action.focus-column-left = [];
        "Mod+Down".action.focus-window-down = [];
        "Mod+Up".action.focus-window-up = [];
        "Mod+Right".action.focus-column-right = [];
        "Mod+H".action.focus-column-left = [];
        "Mod+J".action.focus-window-down = [];
        "Mod+K".action.focus-window-up = [];
        "Mod+L".action.focus-column-right = [];

        # === Window Movement ===
        "Mod+Shift+Left".action.move-column-left = [];
        "Mod+Shift+Down".action.move-window-down = [];
        "Mod+Shift+Up".action.move-window-up = [];
        "Mod+Shift+Right".action.move-column-right = [];
        "Mod+Shift+H".action.move-column-left = [];
        "Mod+Shift+J".action.move-window-down = [];
        "Mod+Shift+K".action.move-window-up = [];
        "Mod+Shift+L".action.move-column-right = [];

        # === Column Navigation ===
        "Mod+Home".action.focus-column-first = [];
        "Mod+End".action.focus-column-last = [];
        "Mod+Ctrl+Home".action.move-column-to-first = [];
        "Mod+Ctrl+End".action.move-column-to-last = [];

        # === Monitor Navigation ===
        "Mod+Ctrl+Left".action.focus-monitor-left = [];
        "Mod+Ctrl+Right".action.focus-monitor-right = [];
        "Mod+Ctrl+H".action.focus-monitor-left = [];
        "Mod+Ctrl+J".action.focus-monitor-down = [];
        "Mod+Ctrl+K".action.focus-monitor-up = [];
        "Mod+Ctrl+L".action.focus-monitor-right = [];

        # === Move to Monitor ===
        "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = [];
        "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = [];
        "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = [];
        "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = [];
        "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = [];
        "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = [];
        "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = [];
        "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = [];

        # === Workspace Navigation ===
        "Mod+Tab" = {
          repeat = false;
          action.focus-workspace-previous = [];
        };
        "Mod+Page_Down".action.focus-workspace-down = [];
        "Mod+Page_Up".action.focus-workspace-up = [];
        "Mod+U".action.focus-workspace-down = [];
        "Mod+I".action.focus-workspace-up = [];
        "Mod+Ctrl+Down".action.move-column-to-workspace-down = [];
        "Mod+Ctrl+Up".action.move-column-to-workspace-up = [];
        "Mod+Ctrl+U".action.move-column-to-workspace-down = [];
        "Mod+Ctrl+I".action.move-column-to-workspace-up = [];

        # === Move Workspaces ===
        "Mod+Shift+Page_Down".action.move-workspace-down = [];
        "Mod+Shift+Page_Up".action.move-workspace-up = [];
        "Mod+Shift+U".action.move-workspace-down = [];
        "Mod+Shift+I".action.move-workspace-up = [];

        # === Mouse Wheel Navigation ===
        "Mod+WheelScrollDown".action.focus-column-right = [];
        "Mod+WheelScrollUp".action.focus-column-left = [];
        "Mod+Shift+WheelScrollDown".action.move-column-right = [];
        "Mod+Shift+WheelScrollUp".action.move-column-left = [];

        # === Numbered Workspaces ===
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;

        # === Move to Numbered Workspaces ===
        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;
        "Mod+Shift+6".action.move-column-to-workspace = 6;
        "Mod+Shift+7".action.move-column-to-workspace = 7;
        "Mod+Shift+8".action.move-column-to-workspace = 8;
        "Mod+Shift+9".action.move-column-to-workspace = 9;

        # === Sizing & Layout ===
        "Mod+R".action.switch-preset-column-width = [];
        "Mod+Shift+R".action.switch-preset-window-height = [];
        "Mod+Ctrl+R".action.reset-window-height = [];
        "Mod+Ctrl+F".action.expand-column-to-available-width = [];
        "Mod+C".action.center-column = [];
        "Mod+Ctrl+C".action.center-visible-columns = [];
        "Mod+F".action.maximize-column = [];

        # === Manual Sizing ===
        "Mod+Minus".action.set-column-width = "-10%";
        "Mod+Equal".action.set-column-width = "+10%";
        "Mod+Shift+Minus".action.set-window-height = "-10%";
        "Mod+Shift+Equal".action.set-window-height = "+10%";

        # === Screenshots ===
        "Mod+Shift+S".action.screenshot = [];
        "Alt+Shift+S".action.screenshot-screen = [];
        "Alt+Ctrl+S".action.screenshot-window = [];
        "Mod+Ctrl+S".action.spawn = ["flameshot" "gui"];
      };
    };
  };
}
