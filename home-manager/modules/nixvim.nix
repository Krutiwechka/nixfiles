{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    nixpkgs.source = pkgs.path;
    colorschemes.dracula.enable = true;

    globals.mapleader = " ";
    opts = {
      number = true;
      relativenumber = true;
      termguicolors = true;
      signcolumn = "yes";
    };

    plugins.lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
      };
    };

    plugins.rustaceanvim = {
      enable = true;
      settings = {
        server = {
          default_settings."rust-analyzer" = {
            check.command = "clippy";
            cargo.allFeatures = true;
          };
        };
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      crates-nvim
      nvim-dap-ui
      nvim-nio
    ];
    extraConfigLua = ''
      require('crates').setup()
      require('dapui').setup()
    '';

    plugins.treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    plugins.blink-cmp = {
      enable = true;
      settings = {
        sources.default = [ "lsp" "path" "buffer" "snippets" ];
      };
    };

    plugins.dap = {
      enable = true;
      adapters.executables.codelldb = {
        command = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/adapter/codelldb";
      };
    };

    plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fs" = "lsp_document_symbols";
      };
    };

    plugins.gitsigns.enable = true;

    plugins.lualine.enable = true;
    plugins.bufferline.enable = true;
    plugins.which-key.enable = true;
    plugins.trouble.enable = true;
    plugins.nvim-autopairs.enable = true;
    plugins.indent-blankline.enable = true;

    keymaps = [
      { mode = "n"; key = "<leader>xx"; action = "<cmd>Trouble diagnostics toggle<CR>"; }
      { mode = "n"; key = "<leader>rr"; action = "<cmd>RustLsp runnables<CR>"; }
      { mode = "n"; key = "<leader>rt"; action = "<cmd>RustLsp testables<CR>"; }
      { mode = "n"; key = "<leader>rd"; action = "<cmd>RustLsp debuggables<CR>"; }

      { mode = "i"; key = "jj"; action = "<Esc>"; }

      { mode = "n"; key = "<leader>w"; action = "<cmd>w<CR>"; }
      { mode = "n"; key = "<leader>q"; action = "<cmd>q<CR>"; }

      { mode = "n"; key = "x"; action = "\"_x"; }
      { mode = "n"; key = "<leader>d"; action = "\"_d"; }
      { mode = "v"; key = "<leader>d"; action = "\"_d"; }

      { mode = "n"; key = "<leader>y"; action = "\"+y"; }
      { mode = "v"; key = "<leader>y"; action = "\"+y"; }
      { mode = "n"; key = "<leader>p"; action = "\"+p"; }
      { mode = "v"; key = "<leader>p"; action = "\"+p"; }
    ];
  };
}
