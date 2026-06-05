{pkgs, ...}: {
  programs.floorp = {
    enable = true;

    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false; # I use bitwarden
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };

    profiles.bezydeynost = {
      id = 0;
      name = "bezydeynost";
      isDefault = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        clearurls
        darkreader
        localcdn
        privacy-badger
        material-icons-for-github
        sponsorblock
        ublock-origin
      ];

      settings = {
        "floorp.verticaltab.enabled" = true;
        "floorp.tabbar.style" = 2;
        "browser.shell.checkDefaultBrowser" = false;
      };
    };
  };

  stylix.targets.floorp.enable = true;
  stylix.targets.floorp.profileNames = ["bezydeynost"];
}
