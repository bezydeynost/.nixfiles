{pkgs, ...}: {
  hardware.keyboard.qmk.enable = true;

  environment.systemPackages = with pkgs; [
    qmk
    qmk-udev-rules
    qmk_hid
    via
  ];

  services.udev.extraRules = ''
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="36b0", ATTRS{idProduct}=="30cc", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"

    # HID-устройства другие
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
  '';
}
