
" ######################################
" " LEADER
" ######################################
let mapleader = " "




" ###########################################################################
" VIM
" ###########################################################################
nnoremap <Leader>si :source $MYVIMRC<cr>
nnoremap <Leader>ve :e ~/.config/nvim/init.vim<cr>
nnoremap <Leader>qq :q<cr>




" ###########################################################################
" VIM - LSP
" ###########################################################################
nnoremap <silent> lc <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> ld <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> lD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> lh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> li <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> ls <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> lt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> lr <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> lf <cmd>lua vim.lsp.buf.formatting()<CR>




" ###########################################################################
" BUFFERS
" ###########################################################################
nnoremap <leader>fs :w<CR>
nnoremap <Leader>bd :bd<CR>




" ###########################################################################
" junegunn/vim-plug
" ###########################################################################
nnoremap <Leader>pi :source $MYVIMRC <CR> <bar> :PlugInstall <CR>




" ###########################################################################
" nvim-telescope/telescope
" ###########################################################################
nnoremap <leader>. <cmd>Telescope find_files<cr>
nnoremap <leader>, <cmd>Telescope buffers<cr>
nnoremap <leader>/ <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>




" ###########################################################################
" beauwilliams/focus.nvim
" ###########################################################################
nnoremap <leader>wj <cmd>FocusSplitDown<cr>
nnoremap <leader>wk <cmd>FocusSplitUp<cr>
nnoremap <leader>wh <cmd>FocusSplitLeft<cr>
nnoremap <leader>wl <cmd>FocusSplitRight<cr>




" ###########################################################################
" NTimUntersberger/neogit'
" ###########################################################################
nnoremap <leader>gg <cmd>Neogit<cr>
