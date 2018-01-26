DOTFILES := $(shell pwd)

all: vim tmux shell tig ack

shell:
	ln -fs $(DOTFILES)/rc/bashrc ${HOME}/.bashrc
vim: 
	ln -fs $(DOTFILES)/rc/vimrc ${HOME}/.vimrc
tmux:
	ln -fs $(DOTFILES)/rc/tmux.conf ${HOME}/.tmux.conf
tig:
	ln -fs $(DOTFILES)/rc/tigrc ${HOME}/.tigrc
ack:
	ln -fs $(DOTFILES)/rc/ackrc ${HOME}/.ackrc
git:
	ln -fs $(DOTFILES)/rc/gitconfig ${HOME}/.gitconfig
vimfiles:
	ln -fs $(DOTFILES)/resources/vim ${HOME}/vim
vimplugins:
	git clone git@github.com:ctrlpvim/ctrlp.vim.git $(DOTFILES)/resources/vim/bundle/ctrlp.vim
	git clone git@github.com:jasoncodes/ctrlp-modified.vim.git $(DOTFILES)/resources/vim/bundle/ctrlp-modified.vim
	git clone git@github.com:Raimondi/delimitMate.git $(DOTFILES)/resources/vim/bundle/delimitMate
	git clone git@github.com:SirVer/ultisnips.git $(DOTFILES)/resources/vim/bundle/ultisnips
	git clone git@github.com:scrooloose/syntastic.git $(DOTFILES)/resources/vim/bundle/syntastic
	git clone git@github.com:Valloric/YouCompleteMe.git $(DOTFILES)/resources/vim/bundle/YouCompleteMe
	git clone git@github.com:tpope/vim-surround.git $(DOTFILES)/resources/vim/bundle/vim-surround
	git clone git@github.com:editorconfig/editorconfig-vim.git $(DOTFILES)/resources/vim/bundle/editorconfig-vim
	git clone git@github.com:plasticboy/vim-markdown.git $(DOTFILES)/resources/vim/bundle/vim-markdown
	git clone git@github.com:albfan/vim-timelapse.git $(DOTFILES)/resources/vim/bundle/vim-timelapse
	git clone git@github.com:tpope/vim-unimpaired.git $(DOTFILES)/resources/vim/bundle/vim-unimpared
	git clone git@github.com:mileszs/ack.vim.git $(DOTFILES)/resources/vim/bundle/ack.vim
	git clone git@github.com:tpope/vim-fugitive.git $(DOTFILES)/resources/vim/bundle/vim-fugitive
	git clone git@github.com:blueshirts/darcula.git $(DOTFILES)/resources/vim/bundle/darcula
	git clone git@github.com:leafgarland/typescript-vim.git $(DOTFILES)/resources/vim/bundle/typescript-vim
	git clone git@github.com:tpope/vim-abolish.git $(DOTFILES)/resources/vim/bundle/vim-abolish
ycm:	
	brew install cmake;
	(
	cd $(DOTFILES)/resources/vim/bundle/YouCompleteMe/;
	git submodule update --init --recursive;
	./install.py --tern-completer
	);

