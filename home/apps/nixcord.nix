{inputs, ...}: {
  imports = [
    inputs.nixcord.homeModules.nixcord
    /home/falguren/.nixmodules/nixcordlsfm.nix
  ];
  programs.nixcord = {
    enable = true;
    discord.equicord.enable = true;
    discord.vencord.enable = false;
    equibop.enable = true;
    config = {
      autoUpdate = true;
      plugins = {
        ClearURLs.enable = true;
        callTimer.enable = true;
        betterUploadButton.enable = true;
        gameActivityToggle.enable = true;
        messageLoggerEnhanced.enable = true;
        noF1.enable = true;
        favoriteEmojiFirst.enable = true;
        forceOwnerCrown.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
        voiceChatDoubleClick.enable = true;
        viewRawVariant.enable = true;
        viewIcons.enable = true;
        volumeBooster.enable = true;
        whoReacted.enable = true;
        noBlockedMessages.enable = true;
        questify.enable = true;
        youtubeAdblock.enable = true;
        FullVCPFP.enable = true;
        SaveFavoriteGIFs.enable = true;
        silentTyping.enable = true;
        spotifyActivityToggle.enable = true;
        spotifyCrack.enable = true;
        petpet.enable = true;
        betterFolders = {
          enable = true;
          closeAllFolders = true;
          closeAllHomeButton = true;
          closeOthers = true;
        };
        gifCollections = {
          enable = true;
          collectionPrefix = "gc:";
          itemPrefix = "gc-item:";
          onlyShowCollections = false;
          showCopyImageLink = false;
          preventDuplicates = true;
          stopWarnings = false;
          defaultEmptyCollectionImage = "https://c.tenor.com/YEG33HsLEaIAAAAC/parksandrec-oops.gif";
        };
      };
    };
  };
}
