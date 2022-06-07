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
Plug 'tpope/vim-fugitive'
Plug 'glepnir/dashboard-nvim'
" Plug 'nvim-telescope/telescope-file-browser.nvim'
" Plug 'nvim-telescope/telescope-project.nvim'
" Plug 'dunstontc/projectile.nvim'
" Plug 'tpope/vim-sensible'

" UI
" Plug 'romgrk/barbar.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'NTBBloodbath/doom-one.nvim'
Plug 'mortepau/codicons.nvim'
Plug 'lambdalisue/battery.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
" Plug 'vim-airline/vim-airline'
" Plug 'enricobacis/vim-airline-clock'
" Plug 'vim-airline/vim-airline-themes'
Plug 'lukas-reineke/indent-blankline.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-telescope/telescope-ui-select.nvim'

" Languages
Plug 'dart-lang/dart-vim-plugin'
Plug 'akinsho/flutter-tools.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Debugging
Plug 'mfussenegger/nvim-dap'
call plug#end()


lua << EOF
require("bufferline").setup{}
EOF

" ###########################################################################
" glepnir/dashboard-nvim
" ###########################################################################
let g:dashboard_default_executive ='telescope'




" ###########################################################################
" vim-airline/vim-airline
" ###########################################################################
" let g:battery#update_tabline = 1
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#branch#enabled=1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" let g:airline#extensions#clock#format = '%a %d | %I:%M'




" ###########################################################################
" yazdani42/nvim-tree.lua
" ###########################################################################
lua << EOF
-- require'nvim-tree'.setup {}
EOF



" ###########################################################################
" vim-lualine/lualine.nvim'
" ###########################################################################
lua << EOF
-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    return ''
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

filename =  {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
local middle  = {
  function()
    return '%='
  end,
}

local lsp = {
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#a9a9a9'},
}

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = ' ', right = ' '},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {filename, middle, lsp},
    lualine_x = {'fileformat', 'filetype', diagnostics},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
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
	sort_lastused = true,
      }
    },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
    },
    file_browser = {
      hijack_netrw = true,
      path = "%:p:h",
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

