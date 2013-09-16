# Handle the fact that this file will be used with multiple OSs
platform=`uname`
if [[ $platform == 'Linux' ]]; then
  alias a='ls -lrth --color'
elif [[ $platform == 'Darwin' ]]; then
  alias a='ls -lrthG'
fi

# Unix
alias c='cd'
alias tf='tail -1000f'
alias tlf="tail -f"
alias ln='ln -v'
alias mkdir='mkdir -p'
alias md='mkdir -p'
alias trunc='cat /dev/null >'
alias ..='cd ..'
alias ...='cd ../..'
alias u='cd ..'
alias l='ls -al'
alias ll='ls -al'
alias lh='ls -Alh'
alias -g G='| grep'
alias -g M='| less'
alias -g L='| wc -l'
alias -g ONE="| awk '{ print \$1}'"
alias e="$EDITOR"
alias v="$VISUAL"
alias v='vim'
alias vi='vim'
alias get='sudo apt-get install'
alias remore='!! | more'
alias retag='ctags -R --exclude=.svn --exclude=.git --exclude=log --exclude=tmp *'
alias sz='source ~/.zshrc && source ~/.zlogin'

# Path Shortcuts
alias code='cd ~/code'
alias oddz='cd ~/code/oddz'
alias d='cd ~/.dotfiles'
alias dr='cd ~/Dropbox'

# File Shortcuts
alias aliases='vim ~/.dotfiles/zsh/aliases'
alias codereview='vim ~/Dropbox/Notes/code-review-checklist.txt'
alias ideas='vim ~/Dropbox/Notes/ideas.txt'
alias tsl='vim ~/Dropbox/Notes/tool_sharpening_list.md'

# Ruby
alias fs='foreman start'
alias irb='irb --readline -r irb/completion'
alias killruby='killall -9 ruby'

# Scala
alias mts='mvn test -Dsuites='

# Services
alias restart_postgres="stoppostgres && startpostgres"
alias startpostgres='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias startredis='redis-server /usr/local/etc/redis.conf &'
alias stoppostgres='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log stop'

# git
alias gpr='git pull --rebase'
alias gcot='git checkout -t'
alias gw='git add . && git commit -m 'WIP' && git push'
alias patch='git format-patch HEAD^ --stdout > patch.diff'
alias sync='git add -u . && git commit -m "Minor changes. Commit message skipped." && repush'
alias repush="gpr && git push"


# Bundler
alias b="bundle"
alias bake='bundle exec rake'
alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'
alias rebi='bundle install && !!'

# Tests and Specs
alias t="ruby -I test"
alias cuc="bundle exec cucumber"

# Rubygems
alias gi="gem install"
alias giv="gem install -v"

# Rails
alias migrate="rake db:migrate db:rollback && rake db:migrate db:test:prepare"
alias m="migrate"
alias rc='rails console'
alias remigrate='rake db:migrate && rake db:migrate:redo && rake db:schema:dump && rake db:test:prepare'
alias rk="rake"
alias rs='bundle install && rails server -p 3000'
alias s="rspec"
alias z="zeus"

# Process management
function sstart() {
  cat /dev/null > $1.pid
  nohup $1 &
  echo $! >> $1.pid
}

function kpid() {
  pid=$(cat $1.pid)
  echo "** Killing pid " + $pid
  kill -9 $pid
  sleep 2
  ps ax | grep $1
}

function wpid() {
  echo $! > $1.pid
}


# Include custom aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local
