{config, pkgs, ... }:

{
  programs.nixvim = {

  plugins.lsp = {
  enable = true;
      setupCapabilities = true;
  servers = {
    nil_ls.enable = true;    # Nix LSP
    pyright.enable = true;   # Python
    ts_ls.enable = true;     # TypeScript/JS
    lua_ls.enable = true;    # Lua
  };
  keymaps.lspBuf = {
    "gd" = "definition";
    "gD" = "references";
    "K" = "hover";
  };
};
plugins.treesitter = {
  enable = true;
  settings = {
    indent.enable = true;
    highlight.enable = true;
  };
};
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>g" = "live_grep";
      "<leader>fb" = "buffers";
      "<leader>fh" = "help_tags";
    };
  };






plugins = {
  # web-devicons.enable = true;
  lualine.enable = true;
  bufferline.enable = true;
  which-key.enable = true;
  cmp-nvim-lsp.enable = true;
  
  # LazyVim-inspired plugins
  nvim-autopairs.enable = true;
  nvim-colorizer.enable = true;
  # indent-blankline.enable = true;
  gitsigns.enable = true;
  todo-comments.enable = true;
  trouble.enable = true;
  illuminate.enable = true;
  
  # Comment.nvim
  comment.enable = true;
  
  neo-tree = {
    enable = true;
    settings.close_if_last_window = true;
   };

  snacks = {
    enable = true;
    settings = {
      bigfile = { enabled = true; };
      notifier = { enabled = true; };
      quickfile = { enabled = true; };
      statuscolumn = { enabled = true; };
      words = { enabled = true; };
    };
  };

  alpha = {
    enable = true;
    settings.layout = [
      {
        type = "padding";
        val = 2;
      }
      {
        type = "text";
        val = [
          "███╗   ██╗██╗   ██╗ ██████╗ ██████╗ ██████╗ ███████╗"
          "████╗  ██║██║   ██║██╔════╝██╔═══██╗██╔══██╗██╔════╝"
          "██╔██╗ ██║██║   ██║██║     ██║   ██║██████╔╝█████╗  "
          "██║╚██╗██║╚██╗ ██╔╝██║     ██║   ██║██╔══██╗██╔══╝  "
          "██║ ╚████║ ╚████╔╝ ╚██████╗╚██████╔╝██║  ██║███████╗"
          "╚═╝  ╚═══╝  ╚═══╝   ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝"
        ];
        opts = {
          hl = "AlphaHeader";
          position = "center";
        };
      }
      {
        type = "padding";
        val = 2;
      }
      {
        type = "text";
        val = "󰈻 LazyVim-inspired NixVim";
        opts = {
          hl = "AlphaComment";
          position = "center";
        };
      }
      {
        type = "padding";
        val = 2;
      }
      {
        type = "group";
        val = [
          {
            type = "button";
            val = "󰈞  Find File";
            on_press.__raw = "function() require('telescope.builtin').find_files() end";
            opts = {
              hl = "AlphaButtons";
              shortcut = "f";
              position = "center";
              width = 50;
              keymap = [ "n" "f" "" ];
            };
          }
          {
            type = "button";
            val = "󰅩  New File";
            on_press.__raw = "function() vim.cmd('ene | startinsert') end";
            opts = {
              hl = "AlphaButtons";
              shortcut = "n";
              position = "center";
              width = 50;
              keymap = [ "n" "n" "" ];
            };
          }
          {
            type = "button";
            val = "󰊄  Recent Files";
            on_press.__raw = "function() require('telescope.builtin').oldfiles() end";
            opts = {
              hl = "AlphaButtons";
              shortcut = "r";
              position = "center";
              width = 50;
              keymap = [ "n" "r" "" ];
            };
          }
          {
            type = "button";
            val = "󰈭  Find Word";
            on_press.__raw = "function() require('telescope.builtin').live_grep() end";
            opts = {
              hl = "AlphaButtons";
              shortcut = "g";
              position = "center";
              width = 50;
              keymap = [ "n" "g" "" ];
            };
          }
          {
            type = "button";
            val = "󰆼  Quit";
            on_press.__raw = "function() vim.cmd('qa') end";
            opts = {
              hl = "AlphaButtons";
              shortcut = "q";
              position = "center";
              width = 50;
              keymap = [ "n" "q" "" ];
            };
          }
        ];
      }
      {
        type = "padding";
        val = 2;
      }
      {
        type = "text";
        val.__raw = "function() return '󰖂 ' .. os.date('%Y-%m-%d %H:%M') end";
        opts = {
          hl = "AlphaFooter";
          position = "center";
        };
      }
    ];
  };

  mini = {
    enable = true;
    modules = {
      basics = {};
      comment = {};
      pairs = {};
      surround = {};
      tabline = {};
      misc = {};
      starter = {};
      icons = {};
    };
    mockDevIcons = true;
  };
  };
 };
}
