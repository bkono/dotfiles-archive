# No arguments: `git status`
# With arguments: acts like `git`
g() {
  cmd=`which hub`
  if [[ ! -a $cmd ]] ; then
    cmd=`which git`
  fi

  if [[ $# > 0 ]]; then
    $cmd $@
  else
    $cmd status
  fi
}

# Complete g like git
compdef g=git
