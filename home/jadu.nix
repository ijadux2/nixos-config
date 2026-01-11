{ config, pkgs, ... }:

{

imports = [
      ./home.nix
      ./pkgs.nix
      ./lua/plugins.nix
      ./lua/custom.nix
      ./lua/keybind.nix
    ];

   programs.nixvim = {
     enable = true;
     
     globals = {
       mapleader = " ";
       maplocalleader = " ";

       # LazyVim-inspired settings
       have_nerd_font = true;
       
       # Use mini.icons instead of web-devicons
       miniicons_enable = true;
     };

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

     extraPlugins = with pkgs.vimPlugins; [
       snacks-nvim
       plenary-nvim
       telescope-nvim
       nvim-web-devicons
       luasnip
     ];

plugins = {
        # LSP servers configuration
        lsp = {
          enable = true;
          capabilities = "require('cmp_nvim_lsp').default_capabilities()";
          servers = {
            nil_ls = {
              enable = true;
              config.formatting.command = ["nixfmt"];
            };
            pyright = {
              enable = true;
              config.python.analysis = {
                typeCheckingMode = "basic";
                autoSearchPaths = true;
              };
            };
            ts_ls = {
              enable = true;
              filetypes = ["javascript" "javascriptreact" "typescript" "typescriptreact"];
            };
            lua_ls = {
              enable = true;
              config.Lua.hint.enable = true;
            };
            cssls.enable = true;
            jsonls.enable = true;
            html.enable = true;
            clangd = {
              enable = true;
              config = {
                fallbackFlags = ["-std=c++20"];
              };
            };
            bashls.enable = true;
            vimls.enable = true;
                    prettier = {
        enable = true;
        settings = {
          arrow_parens = "always";
          bracket_spacing = true;
          bracket_same_line = false;
          end_of_line = "lf";
          jsx_bracket_same_line = false;
          jsx_single_quote = true;
          print_width = 80;
          quote_props = "as-needed";
          semi = true;
          single_quote = true;
          tab_width = 2;
          trailing_comma = "es5";
          use_tabs = false;
        };
      };

      eslint = {
        enable = true;
        settings = {
          codeAction = {
            disableRuleComment = {
              enable = true;
              location = "separateLine";
            };
            showDocumentation = {
              enable = true;
            };
          };
          codeActionOnSave = {
            enable = true;
            mode = "all";
          };
          format = {
            enable = true;
          };
          nodePath = "";
          quiet = false;
          run = "onType";
          validate = "on";
        };
      };
          };
        # Completion configuration
        };
      

        cmp = {
          enable = true;
          autoEnableSources = true;
          settings = {
            snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
            completion.completeopt = "menu,menuone,noselect";
            sources = [
              { name = "nvim_lsp"; priority = 1000; }
              { name = "luasnip"; priority = 750; }
              { name = "path"; priority = 500; }
              { name = "buffer"; priority = 250; }
              { name = "calc"; priority = 200; }
              { name = "emoji"; priority = 150; }
            ];
            mapping = {
              "<C-Space>" = "cmp.mapping.complete()";
              "<C-d>" = "cmp.mapping.scroll_docs(-4)";
              "<C-f>" = "cmp.mapping.scroll_docs(4)";
              "<C-e>" = "cmp.mapping.close()";
              "<CR>" = "cmp.mapping.confirm({ select = true })";
              "<Down>" = "cmp.mapping(function(fallback)\n              if cmp.visible() then\n                cmp.select_next_item()\n              elseif require('luasnip').locally_jumpable(1) then\n                require('luasnip').jump(1)\n              else\n                fallback()\n              end\n            end, { 'i', 's' })";
              "<Up>" = "cmp.mapping(function(fallback)\n              if cmp.visible() then\n                cmp.select_prev_item()\n              elseif require('luasnip').locally_jumpable(-1) then\n                require('luasnip').jump(-1)\n              else\n                fallback()\n              end\n            end, { 'i', 's' })";
              "<Tab>" = "cmp.mapping(function(fallback)\n              if require('luasnip').expand_or_locally_jumpable() then\n                require('luasnip').expand_or_jump()\n              else\n                fallback()\n              end\n            end, { 'i', 's' })";
              "<S-Tab>" = "cmp.mapping(function(fallback)\n              if require('luasnip').locally_jumpable(-1) then\n                require('luasnip').jump(-1)\n              else\n                fallback()\n              end\n            end, { 'i', 's' })";
            };
            window = {
              completion.border = "rounded";
              documentation.border = "rounded";
            };
          };
        };

        luasnip = {
          enable = true;
          settings = {
            enable_autosnippets = true;
            history = true;
            updateevents = "TextChanged,TextChangedI";
          };
        };

        cmp-nvim-lsp.enable = true;
        cmp-buffer.enable = true;
        cmp-path.enable = true;
        cmp_luasnip.enable = true;
        cmp-calc.enable = true;
        cmp-emoji.enable = true;
        lspkind.enable = true;
     };


   };
 }
