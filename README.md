# .dotfiles

## Usage

This assumes you're using some version of macOS.

First brew install the following:

```
brew install make
brew install tmux
brew install vim
brew install ack
brew install reattach-to-user-namespace
```

From within this cloned repository run:

```
make all
make vimplugins
```

If you don't already have a `~/.bash_profile` create it. Add to it:

```
source .bashrc
```

To install YCM run:

```
cd resources/vim/bundle/YouCompleteMe
git submodule update --init --recursive;
./install.py --tern-completer
```
