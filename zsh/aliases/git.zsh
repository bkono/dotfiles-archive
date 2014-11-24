alias gst='git status'
compdef _git gst=git-status
alias gd='git diff'
compdef _git gd=git-diff
alias gp='git pull'
compdef _git gl=git-pull
alias gp!='git push'
compdef _git gp=git-push
alias gc='git commit -v'
compdef _git gc=git-commit
alias gc!='git commit -v --amend'
compdef _git gc!=git-commit
alias gca='git commit -v -a'
compdef _git gc=git-commit
alias gca!='git commit -v -a --amend'
compdef _git gca!=git-commit
alias gco='git checkout'
compdef _git gco=git-checkout
alias gcob='git checkout -b'
compdef _git gco=git-checkout
alias glg='git log --stat --max-count=5'
compdef _git glg=git-log
alias glgg='git log --graph --max-count=5'
compdef _git glgg=git-log
alias glgga='git log --graph --decorate --all'
compdef _git glgga=git-log
alias glo='git log --oneline'
compdef _git glo=git-log
alias gr='git remote'
compdef _git gr=git-remote
alias gra='git remote add'
compdef _git gra=git-remote
alias grs='git remote show'
compdef _git grs=git-remote
alias grv='git remote -v'
compdef _git grv=git-remote
alias grmv='git remote rename'
compdef _git grmv=git-remote
alias grrm='git remote remove'
compdef _git grrm=git-remote
alias grset='git remote set-url'
compdef _git grset=git-remote
alias grup='git remote update'
compdef _git grset=git-remote
alias grb='git rebase'
compdef _git grbi=git-rebase
alias grbi='git rebase -i'
compdef _git grbi=git-rebase
alias grbc='git rebase --continue'
compdef _git grbc=git-rebase
alias grba='git rebase --abort'
compdef _git grba=git-rebase
alias grbm='git rebase master'
compdef _git grbi=git-rebase
alias gb='git branch'
compdef _git gb=git-branch
alias gba='git branch -a'
compdef _git gba=git-branch
alias gbd!='git branch -D'
compdef _git gb=git-branch
alias ga='git add'
compdef _git ga=git-add
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard && git clean -dfx'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
# Will cd into the top of the current repository
# or submodule.
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
compdef git-svn-dcommit-push=git

alias gsr='git svn rebase'
alias gsd='git svn dcommit'
#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
alias glp="_git_log_prettily"
compdef _git glp=git-log

alias gaa='git add --all .'
alias gaad='git ls-files --deleted | xargs git rm'
alias gcfn='git clean -f -d -n'
alias gcf='git clean -f -d'
alias gcl='git clone'
alias gcm="git commit -m"
alias gcam="git commit -am"
alias gdm='git diff master'
alias gf='git fetch'
alias glgs=pretty_git_log -5
alias gm='git checkout master'
alias gm!='git merge'
alias gta='git tag -a'
alias gpt='git push --tags origin master'
alias gsa='git submodule add'
alias gsdi='git submodule deinit'
alias gsi='git submodule init'
alias gsu='git submodule update'
alias gsfe='git submodule foreach'
alias gsfb='git submodule foreach git checkout -b'
alias gsfco='git submodule foreach git checkout'
alias gsfd="git submodule foreach 'git checkout dev || true'"
alias gsfm='git submodule foreach git checkout master'
alias gsfp='git submodule foreach git pull --rebase'
alias gsfp!='git submodule foreach git push'

# Deprecated
alias gl='echo "Use gp instead"'

function g {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}
function gbsu {
  branch=$(git symbolic-ref --short -q HEAD)

  if [[ $# > 0 ]]
  then
    target=$1
  else
    target=$branch
  fi

  git branch --set-upstream-to=origin/$target $branch
}
compdef g=git
