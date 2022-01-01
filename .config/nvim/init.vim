""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"     __   _(_)_ __ ___  _ __ ___
"     \ \ / / | '_ ` _ \| '__/ __|
"      \ V /| | | | | | | | | (__
"       \_/ |_|_| |_| |_|_|  \___|
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  
      autocmd VimEnter * PlugInstall
endif

" nvmim with pyenv
let g:python3_host_prog = '/Users/blairvanderlugt/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog = '/Users/blairvanderlugt/.pyenv/versions/neovim2/bin/python'

call plug#begin("~/.vim/plugged")

  " Plug 'brooth/far.vim'
  Plug 'dracula/vim'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  " Use release branch (recommend)
  " Language servers
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'fannheyward/coc-pyright'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
  " Plug 'jiangmiao/auto-pairs'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'tomlion/vim-solidity'
  " Plug 'evanleck/vim-svelte'
  Plug 'pangloss/vim-javascript'
  Plug 'HerringtonDarkholme/yats.vim'
  " Plug 'codechips/coc-svelte', {'do': 'npm install'}
  Plug 'prettier/vim-prettier', { 'do': 'npm install' }
call plug#end()

" -------------------- general ---------
" set mouse=a               " enable mouse
set mouse-=a                " disable mouse
set noerrorbells            " no sound
set ruler
set cursorline              " Highlight current line
set laststatus=2            " Always show status line
set cmdheight=2

" Numbers
set number
set numberwidth=1
" set relativenumber

" auto complete filename
set wildignorecase
set wildmode=list:longest,full

" menu
set completeopt=menuone,preview

set colorcolumn=100        " for sidebar
set report=0                " Show all changes.
set nowrap                  " line in screen
set showmode                " Show the current mode.
set showcmd                 " show partial command on last line of screen.
set showmatch               " show matching parenthesis
set title                   " Show the filename in the window title bar.
set cursorline              " show a visual line under the cursor's current line
set scrolloff=5             " Start scrolling n lines before horizontal

set t_Co=256                " 256 color support
set hidden                  " do something with buffer

set sidescrolloff=7         " Start scrolling n chars before end of screen.
set sidescroll=1            " The minimal number of columns to scroll
"   horizontally
set autowrite               " autosave
set autoread								" reading a file

set smarttab                    " Better tabs

" Indentation
set smartindent                 " Insert new level of indentation
set autoindent                  " Copy indentation from previous line
set tabstop=2                   " Columns a tab counts for
set softtabstop=2               " Columns a tab inserts in insert mode
set shiftwidth=2                " Columns inserted with the reindent operations
set shiftround                  " Always indent by multiple of shiftwidth
set expandtab                   " Always use spaces instead of tabs

" Temp Files
set nobackup                    " No backup file
set noswapfile                  " No swap file
set nowb

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300


"Spell checking
set spelllang=en_us             " English as default language
" set spell                       " Enable by default

" Splits
set splitbelow                  " Horizontal split below
set splitright                  " Vertical split right

" Same color for sign column and line numbers
highlight clear SignColumn

" when using the >> or << commands, shift lines by 4 spaces
"set shiftwidth=4


" Invisible characters
set nolist
set listchars=eol:¬,tab:▶\ ,trail:~,extends:⟩,precedes:⟨,nbsp:␣
set showbreak=↳\ \ \ "

set clipboard+=unnamedplus


" search
set incsearch
set hlsearch
set ignorecase
set smartcase
set shortmess-=S    " for no. of occurrences

" Save file which you forgot to open with sudo
cnoremap w!! w !sudo tee % >/dev/null
" cnoremap nt NERDTreeToggle %



" -------------- key binding ----------------------------

" disable arrow keys in normal mode
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>



" key binding for moving line up and down
map <c-k> :m-2 <CR>
map <c-j> :m+1 <CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>


" Commenting blocks of code.
" autocmd FileType c,cpp,java,scala let b:comment_g = '// '
" autocmd FileType sh,ruby,python   let b:comment_g = '# '
" autocmd FileType conf,fstab       let b:comment_g = '# '
" autocmd FileType tex              let b:comment_g = '% '
" autocmd FileType mail             let b:comment_g = '> '
" autocmd FileType vim              let b:comment_g = '" '
" noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_g,'\/')<CR>/<CR>:nohlsearch<CR>
" noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_g,'\/')<CR>//e<CR>:nohlsearch<CR>

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" copy, cut and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
" disable autoindent when pasting text
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

" _______________________________________________________________

" _________________ error fix and abs -------------


" for opening images
au BufRead *.png,*.jpg,*.jpeg :call DisplayImage()


command! W :w  " Error
command! Q :q
command! Wq :wq
command! WQ :wq

" _________________ pugins settings ________________
"
if (has("termguicolors"))
 set termguicolors
endif
" syntax enable
colorscheme dracula

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-h> :NERDTreeToggle<CR>
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
" open fuzzy search files in splits
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
"nnoremap <c-n> :call OpenTerminal()<CR>
nmap <CR> o<Esc>k
nnoremap <M-,> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <M-.> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>
" Far settings
let g:far#enable_undo=1
set lazyredraw            " improve scrolling performance when navigating through large results
set ignorecase smartcase  " ignore case only when the pattern contains no capital letters

"Coc server configs
let g:coc_node_path = '$HOME/.nvm/versions/node/v14.17.3/bin/node'
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

" Prettier Settings
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'
au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.js,*.json PrettierAsync


" Golang
 
" Go syntax highlighting
" turn off some things to fix slow scrolling
" https://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
let g:go_highlight_fields = 0
let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Go code operations
autocmd BufEnter *.go nmap <leader>i  <Plug>(go-info)
autocmd BufEnter *.go nmap <leader>ii  <Plug>(go-implements)
autocmd BufEnter *.go nmap <leader>ci  <Plug>(go-describe)
autocmd BufEnter *.go nmap <leader>cc  <Plug>(go-callers)
nmap <leader>cr <Plug>(coc-references)
nmap <C-a> <C-o>
nmap <C-d> <Plug>(coc-definition)
