{ ... }: {
  programs.nixcord = {
    enable = true;          # Enable Nixcord (It also installs Discord)
    discord = {
      vencord.enable = false;  # Use Vencord (default)
      equicord.enable = true;  # Or use Equicord instead (cannot enable both)
    };
    vesktop.enable = false;  # Vesktop
    equibop.enable = true;  # Equibop
    config = {
      plugins = {
      betterFolders = {
          enable = true;
          sidebar = false;
          showFolderIcon = 1;
          keepIcons = false;
          closeAllHomeButton = false;
          closeAllFolders = false;
          forceOpen = false;
          closeServerFolder = false;
          sidebarAnim = false;
          closeOthers = false;
        };

        callTimer = {
          enable = true;
          format = "stopwatch";
        };

        crashHandler = {
          enable = true;
        };

        fakeNitro = {
          enable = true;
          enableEmojiBypass = true;
          emojiSize = 48.0;
          transformEmojis = false;
          enableStickerBypass = true;
          stickerSize = 160.0;
          transformStickers = true;
          transformCompoundSentence = false;
          enableStreamQualityBypass = true;
          useStickerHyperLinks = true;
          useEmojiHyperLinks = true;
          hyperLinkText = "{{NAME}}";
          disableEmbedPermissionCheck = false;
        };

        favoriteEmojiFirst.enable = true;

        favoriteGifSearch = {
          enable = true;
          searchOption = "hostandpath";
        };

        forceOwnerCrown.enable = true;

        gameActivityToggle = {
          enable = true;
          oldIcon = false;
        };

        imageFilename = {
          enable = true;
          showFullUrl = false;
        };

        imageZoom = {
          enable = true;
          size = 640.0;
          zoom = 2.8;
          nearestNeighbour = false;
          square = false;
          saveZoomValues = true;
          invertScroll = true;
          zoomSpeed = 0.5;
        };

        messageLogger = {
          enable = true;
          collapseDeleted = false;
          deleteStyle = "text";
          ignoreBots = false;
          ignoreSelf = false;
          ignoreUsers = "";
          ignoreChannels = "";
          ignoreGuilds = "";
          logEdits = true;
          logDeletes = true;
          showEditDiffs = false;
          inlineEdits = true;
          separatedDiffs = false;
        };

        noF1.enable = true;

        platformIndicators = {
          enable = true;
          colorMobileIndicator = true;
          list = true;
          profiles = true;
          messages = true;
          showBots = false;
          consoleIcon = "equicord"; 
        };

        roleColorEverywhere = {
          enable = true;
          chatMentions = true;
          memberList = true;
          voiceUsers = true;
          reactorsList = true;
          pollResults = true;
          colorChatMessages = false;
        };

        showMeYourName = {
          enable = true;
          hideDefaultAtSign = false;
          replies = true;
          messages = true;
          mentions = true;
          memberList = true;
          profilePopout = true;
          reactions = true;
          discriminators = true;
          truncateAllNamesWithStreamerMode = true;
          removeDuplicates = true;
          ignoreGradients = true;
          ignoreFonts = false;
          animateGradients = false;
          includedNames = "{friend, nick} [{display}] (@{user})";
          nameSeparator = " ";
        };

        silentTyping = {
          enable = true;
          hideMembersListTypingIndicators = false;
          hideChatBoxTypingIndicators = false;
          enabledGlobally = true;
          chatIcon = true;
          defaultHidden = true;
          enabledLocations = "";
          disabledLocations = "";
          chatIconLeftClickAction = "channel";
          chatIconMiddleClickAction = "settings";
          chatIconRightClickAction = "global";
          chatContextMenu = true;
        };

        spotifyCrack = {
          enable = true;
          noSpotifyAutoPause = true;
          keepSpotifyActivityOnIdle = false;
        };

        validReply.enable = true;
        validUser.enable = true;
        voiceDownload.enable = true;

        voiceMessages = {
          enable = true;
          echoCancellation = true;
          noiseSuppression = true;
        };

        volumeBooster = {
          enable = true;
          multiplier = 2.0;
        };

        youtubeAdblock.enable = true;

        equicordToolbox = {
          enable = true;
        };

        FullVCPFP.enable = true; 
        SaveFavoriteGIFs.enable = true;

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

        imgToGif.enable = true;
        lastActive.enable = true;

        messageLoggerEnhanced = {
          enable = true;
        };

        showBadgesInChat = {
          enable = true;
        };

        youtubeDescription.enable = true;
        equicordHelper.enable = true;
        petpet.enable = true;
        unlockedAvatarZoom.enable = true;
        voiceChatDoubleClick.enable = true;
        whoReacted.enable = true;
        noUnblockToJump.enable = true;
        anonymiseFileNames.enable = true;
	questify.enable = true;
        
        # Плагины ниже отключены
        ClearURLs.enable = false;
        CopyUserURLs.enable = false;
        CustomRPC.enable = false;
        IRememberYou.enable = false;
        LastFMRichPresence.enable = false;
        ListenBrainzRPC.enable = false;
        LoginWithQR.enable = false;
        MutualGroupDMs.enable = false;
        NoRPC.enable = false;
        OnePingPerDM.enable = false;
        PinDMs.enable = false;
        RPCEditor.enable = false;
        RPCStats.enable = false;
        RecentDMSwitcher.enable = false;
        ReviewDB.enable = false;
        TiktokTTS.enable = false;
        TosuRPC.enable = false;
        USRBG.enable = false;
        UserPFP.enable = false;
        VCPanelSettings.enable = false;
        XSOverlay.enable = false;
        clientTheme.enable = false;
        consoleJanitor.enable = false;
        consoleShortcuts.enable = false;
        experiments.enable = false;
        memberCount.enable = false;
        mentionAvatars.enable = false;
        noBlockedMessages.enable = false;
        noDevtoolsWarning.enable = false;
        noMosaic.enable = false;
        noPendingCount.enable = false;
        noProfileThemes.enable = false;
        noReplyMention.enable = false;
        noServerEmojis.enable = false;
        noSystemBadge.enable = false;
        noTypingAnimation.enable = false;
        openInApp.enable = false;
        permissionFreeWill.enable = false;
        permissionsViewer.enable = false;
        pictureInPicture.enable = false;
        plainFolderIcon.enable = false;
        previewMessage.enable = false;
        quickMention.enable = false;
        quickReply.enable = false;
        reactErrorDecoder.enable = false;
        readAllNotificationsButton.enable = false;
        relationshipNotifier.enable = false;
        replaceGoogleSearch.enable = false;
        replyTimestamp.enable = false;
        revealAllSpoilers.enable = false;
        reverseImageSearch.enable = false;
        secretRingToneEnabler.enable = false;
        summaries.enable = false;
        sendTimestamps.enable = false;
        serverInfo.enable = false;
        serverListIndicators.enable = false;
        shikiCodeblocks.enable = false;
        showAllMessageButtons.enable = false;
        showConnections.enable = false;
        showHiddenChannels.enable = false;
        showHiddenThings.enable = false;
        showTimeoutDuration.enable = false;
        silentMessageToggle.enable = false;
        sortFriendRequests.enable = false;
        spotifyShareCommands.enable = false;
        startupTimings.enable = false;
        stickerPaste.enable = false;
        streamerModeOnStream.enable = false;
        superReactionTweaks.enable = false;
        textReplace.enable = false;
        spotifyActivityToggle.enable = false;
        themeAttributes.enable = false;
        typingIndicator.enable = false;
        typingTweaks.enable = false;
        unindent.enable = false;
        unsuppressEmbeds.enable = false;
        userMessagesPronouns.enable = false;
        userVoiceShow.enable = false;
        vcNarrator.enable = false;
        viewIcons.enable = false;
        viewRaw.enable = false;
      };
    };
  };
}
