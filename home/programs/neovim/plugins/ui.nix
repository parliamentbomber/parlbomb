{pkgs, ...}: {
  home.packages = with pkgs; [ctags];

  programs.nixvim = {
    colorschemes.oxocarbon.enable = true;
    plugins = {
      barbecue = {
        enable = true;
        settings = {
          theme = "auto";
        };
      };
      fidget = {
        enable = true;
      };
      toggleterm = {
        enable = true;
      };
      zen-mode.enable = true;
      lualine = {
        enable = true;
        settings = {
          options.disabled_filetypes.statusline = ["dashboard" "alpha" "chadtree"];

          alwaysDivideMiddle = true;
          globalstatus = true;
          ignoreFocus = ["chadtree"];
          extensions = ["fzf" "chadtree" "oil" "toggleterm"];
          theme = "auto";
          componentSeparators = {
            left = "|";
            right = "|";
          };
          sectionSeparators = {
            left = "█"; # 
            right = "█"; # 
          };
          sections = {
            lualine_a = ["mode"];
            lualine_b = ["branch" "diff" "diagnostics"];
            lualine_c = ["filename"];
            lualine_x = ["filetype"];
            lualine_y = ["progress"];
            lualine_z = [''" " .. os.date("%R")''];
          };
        };
      };
      web-devicons.enable = true;
      notify = {
        enable = true;
        level = "warn";
      };
      noice = {
        enable = true;
        settings = {
          presets = {
            command_palette = true;
            inc_rename = true;
            lsp_doc_border = true;
            long_message_to_split = true;
          };

          views = {
            popupmenu = {
              backend = "cmp";
            };
          };

          notify = {
            enabled = true;
          };

          messages = {
            enabled = true;
          };

          lsp = {
            message = {
              enabled = true;
            };

            progress = {
              enabled = false;
              view = "mini";
            };
          };

          popupmenu = {
            enabled = true;
            backend = "nui";
          };
        };
      };
      gitsigns = {
        enable = true;
        settings.current_line_blame = false;
      };
      trouble = {
        enable = true;
        settings.auto_refresh = true;
      };
      indent-blankline.enable = true;
      nvim-colorizer.enable = true;
      tagbar = {
        enable = true;
        tagsPackage = pkgs.universal-ctags;
      };
    };
  };
}
