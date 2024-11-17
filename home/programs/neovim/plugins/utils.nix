{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      cheatsheet-nvim
    ];
    plugins = {
      lazygit = {
        enable = true;
      };
      precognition = {
        enable = true;
      };
      nix-develop.enable = true;
      auto-session.enable = true;
      rainbow-delimiters.enable = true;
      yazi.enable = true;
      persistence.enable = true;
      flash = {
        enable = true;
        settings.label.rainbow.enabled = true;
      };
      image = {
        enable = true;
        integrations.markdown = {
          clearInInsertMode = true;
          onlyRenderImageAtCursor = true;
        };
      };
      tmux-navigator.enable = true;
      comment.enable = true;
      nvim-autopairs.enable = true;
      friendly-snippets.enable = true;
      todo-comments.enable = true;
      treesitter-context.enable = true;
      treesitter = {
        enable = true;
        nixGrammars = true;
        settings = {
          indent.enable = true;
          highlight.enable = true;
        };
        folding = false;
        grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
      };
      harpoon = {
        enable = true;
        enableTelescope = true;
        keymapsSilent = true;
        keymaps = {
          addFile = "<leader>ha";
          toggleQuickMenu = "<leader>hu";
          navNext = "<leader>hl";
          navPrev = "<leader>hh";
          navFile = {
            "1" = "<leader>h1";
            "2" = "<leader>h2";
            "3" = "<leader>h3";
            "4" = "<leader>h4";
          };
        };
      };
    };
  };
}
