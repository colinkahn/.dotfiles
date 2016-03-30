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
set noautoread
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

" Use hidden buffers
set hidden

" Colorscheme
set t_Co=256
colorscheme Tomorrow-Night

" Remap ESC
inoremap jj <ESC>

" Tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs/l0c1l0<CR>
vmap <Leader>a: :Tabularize /:\zs/l0c1l0<CR>
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

" Fixing Background
let &colorcolumn=join(range(81,999),",")

" Set `_` as word delimiter
set iskeyword+=_

" Center when finding next word
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()

function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

" Insert the date

:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>

" Tern?
autocmd FileType javascript setlocal omnifunc=tern#Complete

" Netrw
autocmd FileType netrw setl bufhidden=wipe

" Jump to middle of line
nnoremap gm :call cursor(0, len(getline('.'))/2)<CR>

" Show me those god damn quotes!
let g:vim_json_syntax_conceal = 0

" Toggle paste with F2
set pastetoggle=<F2>

" Taste the rainbow!
let g:rainbow_active = 0

" Fix jade syntax highlighting
autocmd BufNewFile,BufRead *.jade set filetype=jade

" Smart return for delmit
let delimitMate_expand_cr=1

" Buffergator
let g:buffergator_viewport_split_policy = 'N'

" UltiSnips
let g:UltiSnipsExpandTrigger='<c-j>'
