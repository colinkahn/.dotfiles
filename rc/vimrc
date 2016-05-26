" Generated using http://yoursachet.com/
" Other settings from https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
"
" VIM Resources
"   - http://stackoverflow.com/questions/1276403/simple-vim-commands-you-wish-youd-known-earlier
"
" VIM Plugins to try out
"   - https://github.com/kien/tabman.vim
"
" VIM Plugins to probably remove
"   - Gundo (because I've never used it once)
"   - Fugitive (either learn to use it or remove it... though Gblame is nice)
"
" VIM Resources
"   - http://vimcasts.org/episodes/profiling-vimscript-performance/
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
set hidden

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
 
" Colorscheme
set t_Co=256
colorscheme darcula

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

" CTRLP
" http://kien.github.io/ctrlp.vim/
let g:ctrlp_show_hidden = 1
let g:ctrlp_mruf_relative = 1
let g:ctrlp_custom_ignore = '\v\~$|(.git|tmp|build|node_modules|vendor|coverage|docs)/|\.(DS_Store|png|gif|jpg|jpeg|eot|ttf|svg|woff|xlsx)$'
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'find %s -type f'
\ }
let g:ctrlp_prompt_mappings = {
    \ 'ToggleFocus()':        ['<up>'],
    \ 'PrtExpandDir()':       ['<down>'],
    \ 'PrtSelectMove("k")':   ['<s-tab>'],
    \ 'PrtSelectMove("j")':   ['<tab>'],
    \ 'PrtCurRight()':        ['<right>'],
    \ 'AcceptSelection("t")': ['<c-l>'],
    \ 'AcceptSelection("v")': ['<c-k>'],
    \ }
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

nmap <LEADER>sw :CtrlPLine<CR><C-\>w
nmap <LEADER>sf :let @"=expand("%:t:r:r")<CR>:CtrlP<CR><C-\>r"

" Always show tab bar
set showtabline=2

" Always show status bar
set laststatus=2

" Screen
nnoremap <silent> <leader>s :call PareditFindOpening('(',')',1)<cr>:ScreenSend<cr>

" Vim Markdown
let g:vim_markdown_folding_disabled=1
au BufRead,BufNewFile *.md set filetype=markdown

" Easy Tabbing
nnoremap <C-S-}> :tabnext<CR>
nnoremap <C-S-{> :tabprev<CR>

" Fixing Background
let &colorcolumn=join(range(81,999),",")

" YCM
set shortmess+=c
let g:ycm_goto_list_height=10

nnoremap <LEADER>gd :YcmCompleter GoToDefinition<CR>
nnoremap <LEADER>gr :YcmCompleter GoToReferences<CR>
nnoremap <LEADER>gt :YcmCompleter GetType<CR>
nnoremap <LEADER>gk :YcmCompleter GetDoc<CR>

" Tsuquyomi
let g:tsuquyomi_disable_quickfix=1
let g:tsuquyomi_disable_default_mappings=1

nnoremap  <LEADER>td :TsuquyomiDefinition<CR>
nnoremap  <LEADER>tb :TsuquyomiGoBack<CR>
nnoremap  <LEADER>tr :TsuquyomiReferences<CR>

" Syntastic
" function! TScfg(where)
"     let cfg = findfile('tsconfig.json', escape(a:where, ' ') . ';')
"     echo cfg !=# '' ? '-p ' . cfg : ''
"     return cfg !=# '' ? '-p ' . cfg : ''
" endfunction
" 
" autocmd FileType typescript let b:syntastic_typescript_tsc_args = TScfg(expand('<amatch>:p:h', 1))

let g:syntastic_debug = 0
let g:syntastic_typescript_tsc_fname = ''

" UltiSnips
let g:UltiSnipsExpandTrigger='<c-j>'

" Smart return for delmit
let delimitMate_expand_cr=1

" Netrw
autocmd FileType netrw setl bufhidden=wipe

" Show me those god damn quotes!
let g:vim_json_syntax_conceal = 0

" Toggle paste with F2
set pastetoggle=<F2>
