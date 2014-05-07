ulimit -n 1000
PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/Code/Arcanist/arcanist/bin/
. ~/.nvm/nvm.sh
. $(dirname "${BASH_SOURCE[0]}")/.bash_prompt
alias tmux="tmux -2"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias ts="tmux switch -t"
alias tl="tmux ls"
export EDITOR=vim
export TERM=screen-256color
