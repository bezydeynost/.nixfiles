{inputs, ...}: {
  imports = [
    inputs.dms.nixosModules.dank-material-shell
  ];

  programs.dank-material-shell = {
    enable = true;

    systemd = {
      enable = false;
      restartIfChanged = true;
    };

    enableSystemMonitoring = true;
    enableVPN = false;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = false;
    enableClipboardPaste = true;
  };

  #services.displayManager.dms-greeter = {
  #  enable = true;
  #  compositor.name = "niri";
  #};
}
