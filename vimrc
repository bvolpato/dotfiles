call plug#begin('~/.vim/plugged')

"Ctrl+P
Plug 'ctrlpvim/ctrlp.vim'

":NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'


" Java
" Plug 'artur-shaik/vim-javacomplete2'

" Plug 'starcraftman/vim-eclim'

" Snippets.
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'


"Theme
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'

"c_, c_e
Plug 'tomtom/tcomment_vim'

Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'

" :Yanks, ,p ,P
Plug 'maxbrunsfeld/vim-yankstack'

" Plug 'bling/vim-airline'
" Plug 'b4winckler/vim-objc'
" Plug 'msanders/snipmate.vim'
" Plug 'mileszs/ack.vim'
" Plug 'kana/vim-textobj-user'
" Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-surround'
" Plug 'Raimondi/delimitMate'
" Plug 'nelstrom/vim-markdown-folding'
" Plug 'tpope/vim-repeat'
" Plug 'nono/vim-handlebars'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'pangloss/vim-javascript'
" Plug 'milkypostman/vim-togglelist'
" Plug 'michalliu/jsruntime.vim'
" Plug 'michalliu/jsoncodecs.vim'
" Plug 'michalliu/sourcebeautify.vim'
" Plug 'jnwhiteh/vim-golang'
" Plug 'teranex/jk-jumps.vim'
" Plug 'tpope/vim-dispatch'
" Plug 'haya14busa/incsearch.vim'
" Plug 'rodjek/vim-puppet'
" Plug 'elixir-lang/vim-elixir'
" Plug 'embear/vim-localvimrc'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'godlygeek/tabular'
" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/vim-js-pretty-template'
" Plug 'keith/swift.vim'
call plug#end()



" Use the Solarized Dark theme
set background=dark
colorscheme solarized
let g:solarized_termtrans=1

" Make Vim more useful
set nocompatible

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu
" Complete files like a shell.
set wildmode=list:longest

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Handle multiple buffers better.
set hidden

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
let mapleader=","

" Tab Maps
nnoremap <leader>t :tabnew<cr>
nnoremap <leader>n :tabnew<cr>
nnoremap <leader>e :tabedit
nnoremap <leader>w :tabclose<cr>
nnoremap <leader><tab> :tabnext<cr>
nnoremap <leader><S-tab> :tabprevious<cr>

" Yanks
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste


" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline

" Make tabs as wide as two spaces
set tabstop=4
" And again, related.
set shiftwidth=4

" Files open expanded
set foldlevelstart=50
" Use decent folding
set foldmethod=indent


" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase
" But case-sensitive if expression contains a capital letter.
set smartcase


" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

" Enable mouse in all modes
set mouse=a

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown


    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

endif


set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

" Font
if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline
   endif
endif
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set t_Co=256

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Always diff using vertical mode
set diffopt+=vertical

" Automatically reads changed files
set autoread




" CtrlP
" Works not only in ancestor directories of my working directory.
let g:ctrlp_working_path_mode = 'a'
" Custom ignores
let g:ctrlp_custom_ignore = 'target\|node_modules\|DS_Store|_build\'



" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Java
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
