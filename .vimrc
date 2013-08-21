" Generated using http://yoursachet.com/
" Other settings from https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
"
" VIM Resources
"   - http://stackoverflow.com/questions/1276403/simple-vim-commands-you-wish-youd-known-earlier
"
set nocompatible

let mapleader=','

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
set backspace=indent,eol,start
set incsearch

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
nnoremap <C-g> :NERDTreeTabsToggle<cr>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']

" Nerdtree Tabs
noremap  <F2> :NERDTreeTabsToggle<cr>
inoremap <F2> <esc>:NERDTreeTabsToggle<cr>
 
" Colorscheme
set t_Co=256
colorscheme Tomorrow-Night

" Remap ESC
inoremap jj <ESC>

" Tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,\zs<CR>
vmap <Leader>a, :Tabularize /,\zs<CR>

" Mouse Support
set mouse=a

" Add Under-Cusor Highlighting
:autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" Count Word Under-Cursor
map <Leader>c :execute ":%s@\\<" . expand("<cword>") . "\\>\@&@gn"<CR>

" Fuzzy Finder
nnoremap <C-t> :FufFile **/<CR>
nnoremap <C-@> :execute ":FufFile **/" . expand("%:t:r")<CR>
let g:fuf_file_exclude = '\v\~$|(tmp|build|node_modules|vendor)/|\.(DS_Store|png|gif|jpg|jpeg|eot|ttf|svg|woff|xlsx)$'

" Always show tab bar
set showtabline=2

" Always show status bar
set laststatus=2

" Screen
nnoremap <silent> <leader>s :call PareditFindOpening('(',')',1)<cr>:ScreenSend<cr>

" Indent Guides
let g:indentLine_char= "┊"
let g:indentLine_first_char = "┊"
let g:indentLine_color_term = 240
let g:indentLine_showFirstIndentLevel = 1

" Vim Markdown
let g:vim_markdown_folding_disabled=1
au BufRead,BufNewFile *.md set filetype=markdown

" Easy Tabbing
nnoremap <C-S-}> :tabnext<CR>
nnoremap <C-S-{> :tabprev<CR>
