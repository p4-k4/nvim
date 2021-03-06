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
Plug 'dcampos/cmp-snippy'
" Plug 'hrsh7th/cmp-vsnip'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'benfowler/telescope-luasnip.nvim'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'honza/vim-snippets'
" Plug 'dcampos/nvim-snippy'
" Plug 'rafamadriz/friendly-snippets'
" Plug 'mthuong/vscode-flutter-freezed-helper'

" Utils
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'folke/trouble.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'andweeb/presence.nvim'
Plug 'preservim/vim-markdown'
Plug 'beauwilliams/focus.nvim'
Plug 'simeji/winresizer'
Plug 'TimUntersberger/neogit'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'sedm0784/vim-resize-mode'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-github.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
" Plug 'tpope/vim-sensible'
" Plug 'dunstontc/projectile.nvim'
" Plug 'nvim-telescope/telescope-project.nvim'
" Plug 'nvim-telescope/telescope-file-browser.nvim'

" UI
Plug 'navarasu/onedark.nvim'
Plug 'mortepau/codicons.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'lambdalisue/battery.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'xiyaowong/nvim-transparent'
Plug 'NTBBloodbath/doom-one.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'vim-airline/vim-airline'
" Plug 'enricobacis/vim-airline-clock'
" Plug 'vim-airline/vim-airline-themes'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-telescope/telescope-ui-select.nvim'

" Languages
Plug 'dart-lang/dart-vim-plugin'
Plug 'akinsho/flutter-tools.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Debugging
Plug 'vim-test/vim-test'
Plug 'mfussenegger/nvim-dap'

call plug#end()




" ###########################################################################
" xiyaowong/nvim-transparent
" ###########################################################################
lua << EOF
require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})
EOF




" ###########################################################################
" lsp-config
" ###########################################################################
lua << EOF
vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
      {"???", "FloatBorder"},
      {"???", "FloatBorder"},
      {"???", "FloatBorder"},
      {"???", "FloatBorder"},
      {"???", "FloatBorder"},
      {"???", "FloatBorder"},
      {"???", "FloatBorder"},
      {"???", "FloatBorder"},
}

-- LSP settings (for overriding per client)
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}
-- require 'lspconfig'.dartls.setup { handlers=handlers }
-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Custom diag signs
local signs = { Error = "??? ", Warn = "??? ", Hint = "??? ", Info = "??? " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Completion kinds
local M = {}

M.icons = {
  Class = "??? ",
  Color = "??? ",
  Constant = "??? ",
  Constructor = "??? ",
  Enum = "??? ",
  EnumMember = "??? ",
  Field = "??? ",
  File = "??? ",
  Folder = "??? ",
  Function = "??? ",
  Interface = "??? ",
  Keyword = "??? ",
  Method = "?? ",
  Module = "??? ",
  Property = "??? ",
  Snippet = "??? ",
  Struct = "??? ",
  Text = "??? ",
  Unit = "??? ",
  Value = "??? ",
  Variable = "??? ",
}

function M.setup()
  local kinds = vim.lsp.protocol.CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = M.icons[kind] or kind
  end
end

return M
EOF



" ###########################################################################
" vim-test/vim-test
" ###########################################################################
let test#strategy = "neovim"




" ###########################################################################
" folke/trouble.nvim'
" ###########################################################################
lua << EOF

require("trouble").setup
  {
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    fold_open = "???", -- icon used for open folds
    fold_closed = "???", -- icon used for closed folds
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
    action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- preview item
        next = "j" -- next item
    },
    indent_lines = true, -- add an indent guide below the fold icons
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
    auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    auto_fold = false, -- automatically fold a file trouble list at creation
    auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
    signs = {
        -- icons / text used for a diagnostic
        error = "???",
        warning = "???",
        hint = "???",
        information = "???",
        other = "???"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}
EOF



" ###########################################################################
" Telescope - luasnip
" ###########################################################################
lua << EOF
require('telescope').load_extension('luasnip')
-- require("luasnip.loaders.from_snipmate").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
EOF




" ###########################################################################
" Bufferline
" ###########################################################################
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
    return '???'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    return '???'
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
  symbols = { error = '??? ', warn = '??? ', info = '??? ' },
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
  icon = '??? LSP:',
  color = { fg = '#a9a9a9'},
}

ins_right {
  function()
    return '???'
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = ' ', right = ' '},
    section_separators = { left = '???', right = '???'},
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
" LSP 
" ###########################################################################
lua <<EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)
EOF



" ###########################################################################
" hrsh7th/nvim-cmp
" ###########################################################################
lua <<EOF

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local kind_icons = {
  Text = "???",
  Method = "???",
  Function = "???",
  Constructor = "???",
  Field = "???",
  Variable = "???",
  Class = "???",
  Interface = "???",
  Module = "???",
  Property = "???",
  Unit = "???",
  Value = "???",
  Enum = "???",
  Keyword = "???",
  Snippet = "???",
  Color = "???",
  File = "???",
  Reference = "???",
  Folder = "???",
  EnumMember = "???",
  Constant = "???",
  Struct = "???",
  Event = "???",
  Operator = "???",
  TypeParameter = ""
}


local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")

local cmp = require'cmp'
cmp.setup(
{
   snippet = {
     expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
     end,
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
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lsp'},
    { name = 'luasnip'},
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
      Text = "???",
      Method = "???",
      Function = "???",
      Constructor = "???",
      Field = "???",
      Variable = "???",
      Class = "???",
      Interface = "???",
      Module = "???",
      Property = "???",
      Unit = "???",
      Value = "???",
      Enum = "???",
      Keyword = "???",
      Snippet = "???",
      Color = "???",
      File = "???",
      Reference = "???",
      Folder = "???",
      EnumMember = "???",
      Constant = "???",
      Struct = "???",
      Event = "???",
      Operator = "???",
      TypeParameter = ""
    },
})
EOF




" ###########################################################################
" nvim-telescope/telescope
" ###########################################################################
lua << EOF


local actions = require('telescope.actions')
require("telescope").setup {
  defaults = {
	initial_mode = "insert",
        mappings = {
            i = {
                -- ['<esc>'] = actions.close,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
            },
	  n = {
	    }
        },
    },
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
      virtual_text_str = "???",
    },
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      enableSnippets = true,
    }
  },
}
EOF

