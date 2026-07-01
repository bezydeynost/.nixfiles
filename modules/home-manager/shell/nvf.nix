{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];
  programs.nvf = {
    enable = true;

    settings.vim = {
      autopairs.nvim-autopairs.enable = true;
      git.gitsigns.enable = true;
      statusline.lualine.enable = true;
      presence.neocord.enable = true;

      filetree.nvimTree = {
        enable = true;
        openOnSetup = false;
        setupOpts = {
          git.enable = true;
          renderer = {
            highlight_git = true;
            highlight_opened_files = "all";
          };
        };
      };

      fzf-lua = {
        enable = true;
        profile = "skim";
        setupOpts.fzf_bin = "${pkgs.skim}/bin/sk";
      };

      clipboard = {
        enable = true;
        providers.wl-copy.enable = true;
      };

      lsp = {
        enable = true;
        formatOnSave = true;
      };

      languages = {
        nix = {
          enable = true;
          extraDiagnostics.enable = true;
          format = {
            enable = true;
            type = ["alejandra"];
          };
        };

        python = {
          enable = true;
          format = {
            enable = true;
            type = ["ruff"];
          };
        };

        go.enable = true;

        bash.enable = true;

        markdown = {
          enable = true;
          extensions.markview-nvim.enable = true;
        };
      };
    };
  };
}
