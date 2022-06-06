
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
" mfussenegger/nvim-dap'
" ###########################################################################
nnoremap <leader>dc <cmd>DapContinue<cr>
nnoremap <leader>dr <cmd>DapToggleRepl<cr>
nnoremap <leader>di <cmd>DapStepInto<cr>
nnoremap <leader>do <cmd>DapStepOut<cr>
nnoremap <leader>dl <cmd>DapShowLog<cr>




" ###########################################################################
" nvim-telescope/telescope
" ###########################################################################
nnoremap <leader>. <cmd>Telescope find_files<cr>
nnoremap <leader>, <cmd>Telescope buffers<cr>
nnoremap <leader>/ <cmd>Telescope live_grep<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
nnoremap <leader><leader> <cmd>Telescope keymaps<cr>




" ###########################################################################
" fakinsho/flutter-tools.nvim
" ###########################################################################
nnoremap <leader>fd <cmd>FlutterDevices<cr>
nnoremap <leader>fD <cmd>FlutterDetatch<cr>
nnoremap <leader>ff <cmd>FlutterRun<cr>
nnoremap <leader>fq <cmd>FlutterQuit<cr>
nnoremap <leader>fr <cmd>FlutterReload<cr>
nnoremap <leader>fR <cmd>FlutterRestart<cr>
nnoremap <leader>fpu <cmd>FlutterPubUpgrade<cr>
nnoremap <leader>fpg <cmd>FlutterPubGet<cr>




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
