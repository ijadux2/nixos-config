{config, pkgs, ... }:

{
  programs.nixvim = {
keymaps = [
  # Neo-tree toggle
  {
    mode = "n";
    key = "<leader>e";
    action = ":Neotree toggle<CR>";
    options.desc = "Toggle Explorer";
  }
  # Easy escape
  {
    mode = "i";
    key = "jk";
    action = "<ESC>";
  }
  # Bufferline navigation
  {
    mode = "n";
    key = "<Tab>";
    action = "<Cmd>BufferLineCycleNext<CR>";
    options.desc = "Next buffer";
  }
  {
    mode = "n";
    key = "<S-Tab>";
    action = "<Cmd>BufferLineCyclePrev<CR>";
    options.desc = "Previous buffer";
  }
  # Comment.nvim keybindings
  {
    mode = "v";
    key = "<leader>c";
    action.__raw = "function() require('Comment.api').toggle.linewise(vim.fn.visualmode()) end";
    options.desc = "Toggle comment for selection";
  }
  # Additional keybindings
  {
    mode = "n";
    key = "<leader><leader>";
    action.__raw = "function() require('telescope.builtin').find_files() end";
    options.desc = "Find files";
  }
  {
    mode = "n";
    key = "<leader>t";
    action = ":terminal<CR>";
    options.desc = "Open terminal";
  }
  {
    mode = "n";
    key = "<leader>l";
    action = ":%<CR>";
    options.desc = "Execute command on all lines";
  }
  # LazyVim-inspired keybindings
  {
    mode = "n";
    key = "<leader>q";
    action = "<CMD>q<CR>";
    options.desc = "Quit";
  }
  {
    mode = "n";
    key = "<leader>w";
    action = "<CMD>w<CR>";
    options.desc = "Write";
  }
  {
    mode = "n";
    key = "<leader>x";
    action = "<CMD>bdelete<CR>";
    options.desc = "Close Buffer";
  }
  {
    mode = "n";
    key = "<leader>|";
    action = "<CMD>vsplit<CR>";
    options.desc = "Split Right";
  }
  {
    mode = "n";
    key = "<leader>-";
    action = "<CMD>split<CR>";
    options.desc = "Split Below";
  }
  # Navigation
  {
    mode = "n";
    key = "<C-h>";
    action = "<C-w>h";
    options.desc = "Go to Left Window";
  }
  {
    mode = "n";
    key = "<C-j>";
    action = "<C-w>j";
    options.desc = "Go to Lower Window";
  }
  {
    mode = "n";
    key = "<C-k>";
    action = "<C-w>k";
    options.desc = "Go to Upper Window";
  }
  {
    mode = "n";
    key = "<C-l>";
    action = "<C-w>l";
    options.desc = "Go to Right Window";
  }
  # Resize
  {
    mode = "n";
    key = "<C-Up>";
    action = "resize +2";
    options.desc = "Increase Window Height";
  }
  {
    mode = "n";
    key = "<C-Down>";
    action = "resize -2";
    options.desc = "Decrease Window Height";
  }
  {
    mode = "n";
    key = "<C-Left>";
    action = "vertical resize -2";
    options.desc = "Decrease Window Width";
  }
  {
    mode = "n";
    key = "<C-Right>";
    action = "vertical resize +2";
    options.desc = "Increase Window Width";
  }
 ];
  };
}
