if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=/Users/tonykova/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/tonykova/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'ciaranm/detectindent.git'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'vim-ruby/vim-ruby.git'
NeoBundle 'derekwyatt/vim-scala.git'
NeoBundle 'kchmck/vim-coffee-script.git'
NeoBundle 'leafgarland/typescript-vim.git'
NeoBundle 'wting/rust.vim'
NeoBundle 'kien/ctrlp.vim' " TODO: make this lazy
NeoBundleLazy 'scrooloose/nerdtree.git'
NeoBundle 'Valloric/YouCompleteMe', {
            \ 'lazy': 1,
            \ 'augroup': 'youcompletemeStart',
            \ 'autoload': {
            \   'insert': 1,
            \ },
            \ 'build': {
            \     'unix': './install.sh --clang-completer --system-libclang',
            \ },
            \ 'build_commands': 'cmake',
            \ 'disabled': !has('python'),
            \ 'vim_version': '7.3.584',
            \}

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Typescript tools
filetype plugin on
au BufRead,BufNewFile *.ts        setlocal filetype=typescript
set rtp+=/usr/local/lib/node_modules/typescript-tools

" Syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" Autodetect indent
autocmd BufRead * DetectIndent

" When opening a read-only file and you get screwed, use this
cnoremap sudow w !sudo tee % >/dev/null

" Remove trailing whitespace
autocmd FileType c,cpp,java,php,javascript,ruby,python autocmd BufWritePre <buffer> :%s/\s\+$//e

" Don't let NERDTree use the weird arrow character
let g:NERDTreeDirArrows=0

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" ctrlp
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fu :CtrlPFunky<Cr> 
" narrow the list down with a word under cursor 
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr> 

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

" Only wrap words visually
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" Better esc
imap hh <Esc>

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
"" vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set colorcolumn=80
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" shew tabs, whitespace and EOL
set list
set listchars=tab:▸\ ,trail:·,nbsp:%

" Quicksave
noremap <C-E> :w<CR>

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Dvorak bindings
no d h
no h j
no t k
no n l
no s :
no S :
no j d
no l n
no L N
no - $
no _ ^
no N <C-w><C-w>
no T <C-w><C-r>
no H 8<Down>
no T 8<Up>
no D <C-w><C-r>set

set expandtab
