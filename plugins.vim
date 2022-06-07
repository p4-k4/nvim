call plug#begin()

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'

" Completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'

" Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Utils
Plug 'folke/trouble.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'beauwilliams/focus.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'TimUntersberger/neogit'
Plug 'andweeb/presence.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'sedm0784/vim-resize-mode'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-github.nvim'
" Plug 'nvim-telescope/telescope-file-browser.nvim'
" Plug 'nvim-telescope/telescope-project.nvim'
" Plug 'dunstontc/projectile.nvim'
" Plug 'tpope/vim-sensible'

" UI
" Plug 'romgrk/barbar.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'mortepau/codicons.nvim'
Plug 'lambdalisue/battery.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lukas-reineke/indent-blankline.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-telescope/telescope-ui-select.nvim'

" Languages
Plug 'dart-lang/dart-vim-plugin'
Plug 'akinsho/flutter-tools.nvim'

" Debugging
Plug 'mfussenegger/nvim-dap'
call plug#end()



" ###########################################################################
" vim-airline/vim-airline
" ###########################################################################
let g:battery#update_tabline = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled = 1




" ###########################################################################
" yazdani42/nvim-tree.lua
" ###########################################################################
lua << EOF
--require'nvim-tree'.setup {}
EOF




" ###########################################################################
" folke/trouble.nvim
" ###########################################################################
lua << EOF
require("trouble").setup {}
EOF




" ###########################################################################
" mfussenegger/nvim-dap'
" ###########################################################################
lua << EOF
  local dap = require('dap')

dap.adapters.dart = {
  type = "executable",
  command = "dart",
  args = {"debug_adapter"}
}
dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch Dart Program",
    program = "${file}",
    cwd = "${workspaceFolder}",
  }
}
EOF




" ###########################################################################
" beauwilliams/focus.nvim'
" ###########################################################################
lua <<EOF
require("focus").setup()
EOF




" ###########################################################################
" dart-lang/dart-vim-plugin'
" ###########################################################################
let g:dart_style_guide = 2
let g:dart_format_on_save = 1




" ###########################################################################
" andweeb/presence.nvim'
" ###########################################################################
lua <<EOF
require("presence"):setup({
    auto_update         = true,
    neovim_image_text   = "The One True Text Editor",
    main_image          = "neovim",
    debounce_timeout    = 10,
    enable_line_number  = false,
    blacklist           = {},
    buttons             = true, 
    editing_text        = "Editing %s",
    file_explorer_text  = "Browsing %s", 
    git_commit_text     = "Committing changes", 
    plugin_manager_text = "Managing plugins",
    reading_text        = "Reading %s",
    workspace_text      = "Working on %s",
    line_number_text    = "Line %s out of %s",
})
EOF




" ###########################################################################
" hrsh7th/nvim-cmp
" ###########################################################################
lua <<EOF

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

--require'lspconfig'.dartls.setup{}

local cmp = require'cmp'
cmp.setup(
{
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping(cmp.mapping.confirm(), { select = true }),
    ['C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['C-j'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	luasnip = "[LuaSnip]",
	nvim_lua = "[Lua]",
	latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp'},
    { name = 'vsnip'},
  }, {
    { name = 'buffer'},
  })
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

EOF




" ###########################################################################
" numToStr/Comment.nvim
" ###########################################################################
lua << EOF
require('Comment').setup()
EOF




" ###########################################################################
" onsails/lspkind.nvim
" ###########################################################################
lua << EOF
require('lspkind').init({
    mode = 'symbol_text',
    preset = 'codicons',
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})
EOF




" ###########################################################################
" nvim-telescope/telescope
" ###########################################################################
lua << EOF

require("telescope").setup {
  sort_mru = true,
  sort_lastused = true,
  ignore_current_buffer = true,
  pickers = {
      buffers = {
	sort_lastused = true
      }
    },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
    },
    file_browser = {
      hijack_netrw = true,
      mappings = {
        ["i"] = {
        },
        ["n"] = {
        },
      },
    },
  }
}
require("telescope").load_extension("ui-select")
require("telescope").load_extension "file_browser"
require('telescope').load_extension('gh')

EOF




" ###########################################################################
" fakinsho/flutter-tools.nvim
" ###########################################################################
lua << EOF
require("flutter-tools").setup {
  ui = {
    border = "rounded",
    notification_style = 'native',
  },
  decorations = {
    statusline = {
      app_version = false,
      device = true,
    },
  },
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    highlight = "ErrorMsg",
    prefix = "//",
    enabled = true
  },
  lsp = {
    color = {
      enabled = false,
      background = false,
      foreground = false,
      virtual_text = true,
      virtual_text_str = "■",
    },
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      enableSnippets = true,
    }
  },
}
EOF

