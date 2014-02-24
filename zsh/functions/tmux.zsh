# tmux functions

function tat() {
  tmux attach -t `basename $PWD`
}

function tn() {
  tmux new -s `basename $PWD`
}
