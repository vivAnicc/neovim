{
  colorschemes.catppuccin.enable = true;

  plugins = {
    lz-n.enable = true;

    image.enable = true;

    oil = {
      enable = true;
      settings = {
        columns = [ "icons" ];
        constrain_cursor = "name";
        default_file_explorer = true;
        skip_confirm_for_simple_edits = true;
      };
    };

    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
      };
    };

    lspconfig.enable = true;

    fzf-lua = {
      enable = true;
      profile = "default";
      settings.files = {
        git_icons = false;
        file_icons = false;
        color_icons = true;
      };
      keymaps = {
        "<leader>sf" = "files";
        "<leader>sb" = "buffers";
        "<leader>sh" = "helptags";
        "<leader>sr" = "resume";
        "<leader>sk" = "keymaps";
        "<leader>sg" = "grep";
        "<leader>sa" = "lsp_code_actions";
        "<leader>ss" = "lsp_document_symbols";
        "<leader>sd" = "diagnostics_workspace";
      };
    };
  };

  lsp = {
    inlayHints.enable = false;

    onAttach = #lua
    ''
      if client:supports_method('textDocument/completion') then
        vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
      end
    '';

    keymaps = [
      {
        key = "gd";
        lspBufAction = "definition";
      }
      {
        key = "gt";
        lspBufAction = "type_definition";
      }
      {
        key = "gr";
        lspBufAction = "references";
      }
      {
        key = "<leader>lr";
        lspBufAction = "rename";
      }
      {
        key = "<leader>ls";
        lspBufAction = "signature_help";
      }
    ];
  };

  extraConfigLua = ''
    vim.cmd("set completeopt+=noselect")
    vim.cmd("set shortmess+=I")
  '';

  autoCmd = [
    {
      event = ["BufEnter"];
      command = "set tabstop=8";
    }
    {
      event = ["BufEnter"];
      command = "set softtabstop=2";
    }
    {
      event = ["BufEnter"];
      command = "set shiftwidth=2";
    }
    {
      event = ["BufEnter"];
      command = "set noexpandtab";
    }
  ];

  opts = {
    tabstop = 8;
    softtabstop = 2;
    shiftwidth = 2;
    expandtab = false;

    ignorecase = true;
    smartcase = true;
    incsearch = true;

    inccommand = "split";

    number = true;
    relativenumber = true;
    signcolumn = "yes";
    cursorcolumn = false;

    smartindent = true;
    cindent = true;

    swapfile = false;
    undofile = true;

    termguicolors = true;

    winborder = "rounded";

    scrolloff = 5;

    timeout = false;

    cmdwinheight = 1;
  };

  globals = {
    mapleader = " ";
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Oil<CR>";
    }
    {
      mode = ["n" "v" "x"];
      key = "<leader>\"";
      action = "\"+";
    }
    {
      mode = "n";
      key = "<C-c>";
      action = "<cmd>nohlsearch<CR><cmd>let @/=\"\"<CR>";
    }
  ];
}
