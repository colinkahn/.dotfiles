" Generated using http://yoursachet.com/
" Other settings from https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
set nocompatible

" Pathogen
call pathogen#infect()
call pathogen#helptags()
 
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on
 
syntax on
set encoding=utf-8
set number
set hlsearch
set autoindent
set history=1000
set cursorline
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set textwidth=80
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set shell=/bin/bash\ --login
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿,vert:│
set autowrite
set autoread
set shiftround
set title
set linebreak
set dictionary=/usr/share/dict/words
set spellfile=~/.vim/custom-dictionary.utf-8.add
set colorcolumn=+1

" No Swapfiles 
set noswapfile

" Line Return
augroup line_return
        au!
            au BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \     execute 'normal! g`"zvzz' |
                    \ endif
        augroup END

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Nerdtree
nnoremap <C-g> :NERDTreeToggle<cr>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
 
" Colorscheme
set t_Co=256
colorscheme Tomorrow-Night

" Remap ESC
inoremap jj <ESC>
