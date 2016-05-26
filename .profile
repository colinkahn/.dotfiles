ulimit -n 1000

export CLOJURESCRIPT_HOME=$HOME/code/clojurescript/

PATH=$HOME/bin:/usr/local/bin:$CLOJURESCRIPT_HOME/bin:$PATH:$HOME/Code/Arcanist/arcanist/bin/

alias nbin='PATH=$(npm bin):$PATH'

. ~/.nvm/nvm.sh
. $(dirname "${BASH_SOURCE[0]}")/.bash_prompt
alias tmux="tmux -2"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias ts="tmux switch -t"
alias tl="tmux ls"
export EDITOR=vim
export TERM=screen-256color
