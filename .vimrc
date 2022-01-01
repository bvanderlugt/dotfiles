"" ---------------------- USABILITY CONFIGURATION ----------------------
""  Basic and pretty much needed settings to provide a solid base for
""  source code editting
"
"" don't make vim compatible with vi
"set nocompatible
"
"" turn on syntax highlighting
"syntax on 
"" and show line numbers
"set number
"
"" make vim try to detect file types and load plugins for them
"filetype off
"
"" reload files changed outside vim
"set autoread
"
"" auto save if leaving buffer
"set autowrite
"set autowriteall
"
"" encoding is utf 8
"set encoding=utf-8
"set fileencoding=utf-8
"
"" enable matchit plugin which ships with vim and greatly enhances '%'
"" runtime macros/matchit.vim
"
"" by default, in insert mode backspace won't delete over line breaks, or
"" automatically-inserted indentation, let's change that
"set backspace=indent,eol,start
"
"" dont't unload buffers when they are abandoned, instead stay in the
"" background
"set hidden
"
"" set unix line endings
"set fileformat=unix
"" when reading files try unix line endings then dos, also use unix for new
"" buffers
"set fileformats=unix,dos
"
"" save up to 100 marks, enable capital marks
"set viminfo='100,f1
"
"" screen will not be redrawn while running macros, registers or other
"" non-typed comments
"set lazyredraw
"
"set cursorline
"
"" ---------------------- CUSTOMIZATION ----------------------
""  The following are some extra mappings/configs to enhance my personal
""  VIM experience
"" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
"nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
"nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
"
"set nowrap
"set colorcolumn=80
"
"" set , as mapleader
"let mapleader = ","
"
"" map <leader>q and <leader>w to buffer prev/next buffer
"noremap <leader>q :bp<CR>
"noremap <leader>w :bn<CR>
"
"" windows like clipboard
"" yank to and paste from the clipboard without prepending "* to commands
"let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
"" map c-x and c-v to work as they do in windows, only in insert mode
"vm <c-x> "+x
"vm <c-c> "+y
"cno <c-v> <c-r>+
"exe 'ino <script> <C-V>' paste#paste_cmd['i']
"
"" save with ctrl+s
"nmap <c-s> :w<CR>
"imap <c-s> <Esc>:w<CR>a
"
"":nmap <c-s> :w<CR>
"":imap <c-s> <Esc>:w<CR>a
"
"" hide unnecessary gui in gVim
"if has("gui_running")
" set guioptions-=m  " remove menu bar
" set guioptions-=T  " remove toolbar
" set guioptions-=r  " remove right-hand scroll bar
" set guioptions-=L  " remove left-hand scroll bar
"end
"
"" set Adobe's Source Code Pro font as default
"set guifont=Source\ Code\ Pro
"
"" allow Tab and Shift+Tab to
"" tab  selection in visual mode
"vmap <Tab> >gv
"vmap <S-Tab> <gv
"
"" remove the .ext~ files, but not the swapfiles
"set nobackup
"set writebackup
"set noswapfile
"
"" search settings
"set incsearch        " find the next match as we type the search
"set hlsearch         " hilight searches by default
"
"" use ESC to remove search higlight
"" nnoremap <esc> :noh<return><esc>
"
"" most of the time I should use ` instead of ' but typing it with my keyabord
"" is a pain, so just toggle them
"nnoremap ' `
"nnoremap ` '
"
"" suggestion for normal mode commands
"set wildmode=list:longest
"
"" keep the cursor visible within 3 lines when scrolling
"set scrolloff=3
"
"" indentation
"set expandtab       " use spaces instead of tabs
"set autoindent      " autoindent based on line above, works most of the time
"set smartindent     " smarter indent for C-like languages
"set shiftwidth=4    " when reading, tabs are 4 spaces
"set softtabstop=4   " in insert mode, tabs are 4 spaces
"
"" no lines longer than 80 cols
"set textwidth=80
"
"" use <C-Space> for Vim's keyword autocomplete
""  ...in the terminal
"inoremap <Nul> <C-n>
""  ...and in gui mode
"inoremap <C-Space> <C-n>
"
"" On file types...
""   .md files are markdown files
"" autocmd BufNewFile,BufRead *.md setlocal ft=markdown
"
"" when pasting over SSH it's a pain to type :set paste and :set nopaste
"" just map it to <f9>
"set pastetoggle=<f9>
"
"" select all mapping
"noremap <leader>a ggVG
"
"" remap escape key
"inoremap jj <ESC>
"
"" file specific
"autocmd FileType tf setlocal ts=2 sts=2 sw=2 
"autocmd Filetype html setlocal ts=4 sts=4 sw=4 omnifunc=htmlcomplete#CompleteTags
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType javascript setlocal ts=4 sts=4 sw=4
"autocmd FileType python setlocal ts=4 sts=4 sw=4
"autocmd FileType yaml setlocal ts=2 sts=2 sw=2
"autocmd FileType css setlocal ts=4 noet sw=4 omnifunc=csscomplete#CompleteCSS
