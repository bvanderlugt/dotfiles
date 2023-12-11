" # Basic Config #
set encoding=UTF-8
set backspace=2
set number
colorscheme desert 
set nobackup   

" # Visual Mode Mappings #
" ## Sort selected text ##
vmap <leader>abc :sort<CR>

" # Internal Plugins #
" ## Syntax highlighting from ~/.vim/syntax ##
syntax enable
" ## Filtetype specific plugins from ~/.vim/ftplugin ##
filetype plugin on
" ## Filtetype based indenting from ~/.vim/indent ##
filetype indent on

" # External Plugins #
" ## Variable Init ##
"let g:coc_node_path = '/opt/homebrew/bin/node'
let $FZF_DEFAULT_COMMAND.=' --hidden'
let $PYTHONUNBUFFERED=1
 
"" ## Loading the Plugins ##
" call plug#begin("~/.vim/plugged")
"
"" ## Manually managed vimballs
"" # Plug '~/.vim/vimballs/plugged/AnsiEsc'
"
"" ## Custom text objects ##
"
"## Language specific plugins ##
"Plug 'tomlion/vim-solidity'
"Plug 'vyperlang/vim-vyper'
"" ### Pandoc markdown formatting and conceal ###
"Plug 'vim-pandoc/vim-pandoc-syntax'
"" ### Python autoformatter not on homebrew vim ###
"" Plug 'psf/black', { 'branch': 'stable' }
"
"" ## fzf ##
"Plug 'junegunn/fzf.vim'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"
"" ## COC (VSCode extensions) ##
"Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
"
"" ## Interactive Testing ##
"Plug 'vim-test/vim-test'
"" ### Async Make (for vim-test) ###
"Plug 'neomake/neomake'
"
"" ## Highlight and fix trailing whitespace ##
"Plug 'ntpeters/vim-better-whitespace'
"" ## Highlight what was yanked. ##
"Plug 'machakann/vim-highlightedyank'
"
"" ## Hightlighting of hex color codes in that color ##
"Plug 'ap/vim-css-color'
"
"" !!! MUST BE FINAL IMPORT !!!
"" ## UTF-8 font icons ##
"Plug 'ryanoasis/vim-devicons'
"
" call plug#end()
"
"
