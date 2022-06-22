
" ######################################
" " LEADER
" ######################################
let mapleader = " "




" ###########################################################################
" VIM
" ###########################################################################
nnoremap <Leader>si :source $MYVIMRC<cr>
nnoremap <Leader>ve :e ~/.config/nvim/init.vim<cr>
nnoremap <Leader>qq :qa<cr>

" Show diagnostics in a floating window
nnoremap <Leader>e <cmd>lua vim.diagnostic.open_float()<CR>


" ###########################################################################
" VIM - LSP
" ###########################################################################
nnoremap <Leader>lc <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <Leader>ld <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <Leader>lD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <Leader>lh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>li <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <Leader>ls <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <Leader>lt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <Leader>lr <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <Leader>lf <cmd>lua vim.lsp.buf.formatting()<CR>




" ###########################################################################
" BUFFERS
" ###########################################################################
nnoremap <leader>fs :w<CR>
nnoremap <Leader>bd :bd \| bp#<CR>




" ###########################################################################
" WINDOWS
" ###########################################################################
nnoremap <leader>wd :close<CR>




" ###########################################################################
" junegunn/vim-plug
" ###########################################################################
nnoremap <Leader>pi :source $MYVIMRC <CR> <bar> :PlugInstall <CR>




" ###########################################################################
" mfussenegger/nvim-dap'
" ###########################################################################
noremap <leader>dc <cmd>DapContinue<cr>
nnoremap <leader>dr <cmd>DapToggleRepl<cr>
nnoremap <leader>di <cmd>DapStepInto<cr>
nnoremap <leader>do <cmd>DapStepOut<cr>
nnoremap <leader>dl <cmd>DapShowLog<cr>




" ###########################################################################
" Fugitive
" ###########################################################################
noremap <leader>gs <cmd>Git stage<cr>




" ###########################################################################
" nvim-telescope/telescope
" ###########################################################################
nnoremap <leader>. <cmd>Telescope find_files<cr>
nnoremap <leader>, <cmd>Telescope buffers<cr>
nnoremap <leader>/ <cmd>Telescope file_browser<cr>
nnoremap <leader>l <cmd>Telescope live_grep<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
nnoremap <leader>ghg <cmd>Telescope gh gist<cr>
nnoremap <leader><leader> <cmd>Telescope keymaps<cr>




" ###########################################################################
" folke/trouble.nvim
" ###########################################################################
" nnoremap <leader>t <cmd>Trouble<cr>
" nnoremap <leader>T <cmd>TroubleClose<cr>




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




" ###########################################################################
" LuaSnip
" ###########################################################################
nnoremap <leader>s <cmd>Telescope luasnip<cr>


" ###########################################################################
" vim-test
" ###########################################################################
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>


" ###########################################################################
" windowresized
" ###########################################################################
nnoremap <leader>wr :WinResizerStartResize<CR>
