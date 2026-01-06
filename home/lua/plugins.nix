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
  grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    vim
    regex
    lua
    bash
    markdown
    markdown_inline
  ];
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
  nui.enable = true;
  nvim-notify.enable = true;
  noice = {
    enable = true;
    settings = {
      lsp = {
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };
      };
      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
        inc_rename = false;
      };
      routes = [
        {
          filter = {
            event = "msg_show";
            find = "written";
          };
          opts = { skip = true; };
        }
      ];
    };
  };

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
