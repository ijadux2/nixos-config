{ config, pkgs, ... }:

{
   imports = [
    ./home.nix
    ./lua/keybind.nix
    ./lua/plugins.nix
    ./lua/cmp.nix
   ];


  programs.nixvim = {
    config = {
      enable = true;
    globals.mapleader = " ";
    globals.maplocalleader = " ";
    
    # LazyVim-inspired settings
    globals.have_nerd_font = true;

    colorschemes.catppuccin.enable = true;

    opts = {
      number = true;
      relativenumber = true;
      signcolumn = "yes";
      cursorline = true;

      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;

      smartindent = true;
      wrap = false;
      scrolloff = 8;
      termguicolors = true;
      clipboard = "unnamedplus";
      
      # LazyVim-inspired optimizations
      updatetime = 250;
      timeoutlen = 300;
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      showmode = false;
      pumheight = 10;
    };
  };
 };
}

