{ config, pkgs, ... }:

{
  programs.nixvim.plugins = {
    # UI Plugins
    web-devicons.enable = true;
    lualine.enable = true;
    bufferline.enable = true;
    which-key.enable = true;
    
    # LazyVim-inspired plugins
    nvim-autopairs.enable = true;
    nvim-colorizer.enable = true;
    gitsigns.enable = true;
    todo-comments.enable = true;
    trouble.enable = true;
    illuminate.enable = true;
    nui.enable = true;
    nvim-notify.enable = true;
    
    # Comment.nvim
    comment.enable = true;
    
    # Treesitter
    treesitter.enable = true;

    # Telescope
    telescope.enable = true;
    # Neo-tree
    neo-tree.enable = true;
    # Snacks
    snacks.enable = true;

    # Mini.nvim
    mini.enable = true;
    
    # React Native development plugins
    nvim-dap.enable = true;
    nvim-dap-ui.enable = true;
    nvim-dap-virtual-text.enable = true;
    
    # React/TypeScript specific plugins
    typescript-tools.enable = true;
    prettier.enable = true;
    eslint.enable = true;
  };
}
