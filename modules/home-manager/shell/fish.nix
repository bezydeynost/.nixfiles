{
  programs.fish = {
    enable = true;
    shellAliases = let
      flakeDir = "~/.dotfiles";
    in {
      cat = "bat";
      ff = "fastfetch";
      b = "btop";
      y = "yazi";
      v = "nvim";
      ls = "eza --icons";
      ll = "eza -l --icons";
      la = "eza -la --icons";
      lt = "eza --tree --icons";
      llt = "eza -l --tree --icons";
      rm = "rm -i";
      py = "python";
      find = "fd";
      grep = "rg";
      rbs = "sudo nixos-rebuild switch --impure --flake ${flakeDir}";
      rbb = "sudo nixos-rebuild boot --impure --flake ${flakeDir}";
      upd = "sudo nix flake update --flake ${flakeDir}";
      grb = "sudo nix-collect-garbage -d";
      pkgs = "nvim ${flakeDir}/nixos/pkgs.nix";
    };
    functions = {
    };
    interactiveShellInit = ''
      set -U fish_greeting ""
    '';
  };
}
