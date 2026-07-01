{
  pkgs,
  config,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    autosuggestion = {
      enable = true;
      strategy = [
        "history" # Chooses the most recent match from history.
        "completion" # Chooses a suggestion based on what tab-completion would suggest. (requires Zsh 3.1 or later)
      ];
    };

    syntaxHighlighting.enable = true;

    # Плюс это https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet
    shellAliases = let
      flakeDir = "~/.dotfiles";
    in {
      rbs = "sudo nixos-rebuild switch --flake ${flakeDir}"; # Применить новый конфиг сразу
      rbb = "sudo nixos-rebuild boot --flake ${flakeDir}"; # Применить новый конфиг после ребута пк

      # Обновить все flake inputs до последних версий. Возможно это аналог "sudo pacman -Sy" на Arch Linux
      # Если после upd дописать название инпута из flake.nix, то обновится только указанный инпут
      upd = "sudo nix flake update --flake ${flakeDir}";

      # Garbage collector. Удалить все не используемые пакеты (например после обновы)
      grb = "sudo nix-collect-garbage -d";

      pkgs = "v ${flakeDir}/nixos/pkgs.nix";
      v = "nvim";
      rm = "rm -i";
      ls = "eza --icons";
      ll = "eza -l --icons";
      la = "eza -la --icons";
      lt = "eza --tree --icons";
      llt = "eza -l --tree --icons";
      y = "yazi";
      b = "btop";
      cat = "bat";
      t = "timer";
      f = "fastfetch";
      py = "python";
      find = "fd";
      grep = "rg";
      niriconf = "nvim ${flakeDir}/config/niri/config.kdl";
      flake = "nvim ${flakeDir}/flake.nix";
    };

    history = {
      size = 10000;
      path = "${config.home.homeDirectory}/.zsh_history";
      ignoreAllDups = true;
      ignoreSpace = true;
    };

    initContent = builtins.readFile ./zsh-init.sh;

    historySubstringSearch = {
      enable = true;
      searchUpKey = [
        "^[[A"
        "$terminfo[kcuu1]"
      ];
      searchDownKey = [
        "^[[B"
        "$terminfo[kcud1]"
      ];
    };

    oh-my-zsh = {
      # https://github.com/ohmyzsh/ohmyzsh
      enable = true;
      plugins = [
        "git"
        "npm"
        "history"
        "rust"
        "golang"
        "foot"
        "gh"
        "aliases" # "als" в терминале покажет все алиасы (нет). Можно добавить слово для фильтрации
        "colored-man-pages" # Adds colors to man pages
        "command-not-found" # Скажет какой пакет скачать, если команда не найдена
        "copypath" # В терминале "copypath" скопирует нынешний абсолютный путь. Можно "copypath файл или дироктория"
        "dirhistory" # Лютая имба https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dirhistory
        "extract" # В терминале "extract filename" чтоб разархивировать файл. Одна команда на все архивы
        "safe-paste" # Preventing any code from running while pasting, so you have a chance to review what was pasted
        "ssh-agent" # Автостарт ssh-agent. Хз надо ли настраивать и если да, то как
        "universalarchive" # Run "ua <format> <files>"" to compress <files> into an archive file using <format>
      ];
    };
  };

  home.packages = with pkgs; [
    zsh-you-should-use # Напомнит, если у написанной команды есть алиас
    zsh-nix-shell # zsh plugin that lets you use zsh in nix-shell shell
    nix-zsh-completions
    zsh-abbr
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
