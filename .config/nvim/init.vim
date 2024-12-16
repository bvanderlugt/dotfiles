syntax enable
set nu ru et
set ts=2 sts=2 sw=2
set cursorline
set hlsearch
set autowrite
set nowrap         " line in screen au BufRead,BufNewFile *.md setlocal textwidth=80
set nocompatible   " be improved, required
set clipboard=unnamedplus " copy to system clipboard
filetype off
" filetype plugin indent on " this should run on Plug end

" # External Plugins #
" ## Variable Init ##
"let g:coc_node_path = '/opt/homebrew/bin/node'
let $FZF_DEFAULT_COMMAND.=' --hidden'
let $PYTHONUNBUFFERED=1

" auto-install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" store the plugins in plugged dir
call plug#begin('~/.config/nvim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " ## Language specific plugins ##
  Plug 'tomlion/vim-solidity'
  Plug 'vyperlang/vim-vyper'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " ### Pandoc markdown formatting and conceal ###
  Plug 'vim-pandoc/vim-pandoc-syntax'
  " ### Python autoformatter not on homebrew vim ###
  Plug 'psf/black', { 'branch': 'stable' }
  Plug 'dense-analysis/ale'
  Plug 'nvie/vim-flake8'

  " ## Interactive Testing ##
  Plug 'vim-test/vim-test'
  " ### Async Make (for vim-test) ###
  Plug 'neomake/neomake'

  " ### General plugins ###
  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-fugitive'
  Plug 'preservim/nerdtree'
  Plug 'editorconfig/editorconfig-vim'
  "Plug 'kien/ctrlp.vim'

  " ## fzf ##
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

  " ### for testing rest apis ###
  Plug 'diepm/vim-rest-console'

  " Plug 'yaegassy/coc-ansible', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'pearofducks/ansible-vim'
  "
  " ## Highlight and fix trailing whitespace ##
  Plug 'ntpeters/vim-better-whitespace'
  " ## Highlight what was yanked. ##
  Plug 'machakann/vim-highlightedyank'

"" ## Hightlighting of hex color codes in that color ##
"Plug 'ap/vim-css-color'
  " ### ai assisted coding ###
  Plug 'github/copilot.vim'
  " for copilot chat
  Plug 'nvim-lua/plenary.nvim'
  Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'main' }

  " Astro
  Plug 'wuelnerdotexe/vim-astro'

call plug#end()
" select the color scheme
colorscheme gruvbox
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
map <silent> <C-n> :NERDTreeFocus<CR>k

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Go settings

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" autocomplete prompt on '.'
" au filetype go inoremap <buffer> . .<C-x><C-o>

" Python Configs
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" encoding
set encoding=utf-8

" python highlighting
let python_highlight_all=1

" Ansible
let g:coc_filetype_map = {
  \ 'yaml.ansible': 'ansible',
  \ }

" coc settings
let g:coc_enable_hover = 1


" vim-rest-console
let g:vrc_output_buffer_name = '__VRC_OUTPUT.<filetype>'

" copilot settings
let g:copilot_filetypes = {
    \ 'gitcommit': v:true,
    \ 'markdown': v:true,
    \ 'yaml': v:true,
    \ 'python': v:true,
    \ }

autocmd BufReadPre *
   \ let f=getfsize(expand("<afile>"))
   \ | if f > 100000 || f == -2
   \ | let b:copilot_enabled = v:false
   \ | endif

" FZF settings
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
set grepprg=rg\ --vimgrep\ --smart-case\ --follow " use ripgrep for grepping

" goto next whitespace block
" https://vim.fandom.com/wiki/Move_to_next/previous_line_with_same_indentation
nnoremap <M-,> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <M-.> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

" Copilot Chat
lua << EOF
require("CopilotChat").setup {
  debug = true, -- Enable debugging
  -- See Configuration section for rest
}
EOF

let g:astro_typescript = 'enable'
