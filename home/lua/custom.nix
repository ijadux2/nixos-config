{ config, pkgs, ... }:

{
  programs.nixvim.plugins = {
    # LSP customizations
    lsp = {
      keymaps = {
        silent = true;
        lspBuf = {
          gd = "definition";
          gr = "references";
          gI = "implementation";
          gD = "type_definition";
          K = "hover";
          "<leader>ca" = "code_action";
          "<leader>rn" = "rename";
          "<leader>f" = "format";
        };
        diagnostic = {
          "<leader>e" = "open_float";
          "[d" = "goto_prev";
          "]d" = "goto_next";
        };
      };
    };

    # Treesitter customizations
    treesitter = {
      config = {
        indent.enable = true;
        highlight.enable = true;
      };
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        vim
        regex
        lua
        bash
        markdown
        markdown_inline
        nix
        python
        typescript
        javascript
        json
        css
        html
        cpp
        c
        nu
        tsx
      ];
    };

    # Telescope customizations
    telescope = {
      keymaps = {
        "<leader>g" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
      };
    };

    # Snacks customizations
    snacks = {
      enable = true;
      config = {
        bigfile = { enabled = true; };
        notifier = { enabled = true; };
        quickfile = { enabled = true; };
        statuscolumn = { enabled = true; };
        words = { enabled = true; };
      };
    };

    # Mini.nvim customizations
    mini = {
      enable = true;
      modules = {
        basics = {};
        comment = {};
        pairs = {};
        surround = {};
        tabline = {};
        misc = {};
        icons = {};
      };
      mockDevIcons = true;
    };

    # Neo-tree customizations
    neo-tree = {
      config.close_if_last_window = true;
    };
    trouble = {
      enable = true;
      settings = {
        position = "bottom";   # bottom | left | right | top
        height = 20;
        use_diagnostic_signs = true;
      };
    };
  };
}
