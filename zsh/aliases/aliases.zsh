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
alias l='gls -AlhF --group-directories-first --color=auto'
# alias l='ls -AlhF'
alias ll='gls -al --color=auto'
alias lh='gls -Alh --color=auto'
alias -g G='| grep'
alias -g G2='| grep -C2'
alias -g M='| more'
alias -g L='| wc -l'
alias -g ONE="| awk '{ print \$1}'"
alias e="$EDITOR"
alias v="$VISUAL"
alias v='vim'
alias vi='vim'
alias get='sudo apt-get install'
alias remore='!! | more'
alias retag='ctags -Ra'
# alias retag='ctags -R --exclude=.svn --exclude=.git --exclude=log --exclude=tmp --exclude=target --exclude=vendor *'
alias rubytags='ctags -R --languages=ruby --exclude=.git --exclude=log --exclude=tmp --exclude=target . $(bundle list --paths)'
alias sz='source ~/.zshrc && source ~/.zlogin'
alias pj='ps aux | grep java'
alias pkj='pkill java'
alias pkr='pkill rails'
alias pkjr='pkill jruby'
alias watch='watch -n 1 '

# Path Shortcuts
alias code='cd ~/code'
alias oddz='cd ~/code/oddz'
alias d='cd ~/.dotfiles'
alias dr='cd ~/Dropbox'
alias jet='cd ~/servers/jetty/'

# Server Shortcuts
alias cpunraid='ssh -L 4200:localhost:4243 root@unraid-bk.local'

# File Shortcuts
alias aliases='vim ~/.dotfiles/zsh/aliases'
alias codereview='vim ~/Dropbox/Notes/code-review-checklist.txt'
alias ideas='vim ~/Dropbox/Notes/ideas.txt'
alias tsl='vim ~/Dropbox/Notes/tool_sharpening_list.md'

# brew shortcuts
alias bci='brew cask install'
alias bcs='brew cask search'
alias bcu='brew cask uninstall'

# installation shortcuts
alias relaptop='bash <(curl -s https://raw.githubusercontent.com/bkonowitz/laptop/master/mac) |& tee ~/laptop.log'

# Maven shortctus
alias mc='mvn compile'
alias mcc='mvn clean compile'
alias mci='mvn clean install'
alias mi='mvn install'
alias mp='mvn package'
alias mpnt='mvn package -DskipUnitTests=true -DskipItTests=true -Dmaven.test.skip=true'
alias mcp='mvn clean package'
alias mcpnt='mvn clean package -DskipUnitTests=true -DskipItTests=true -Dmaven.test.skip=true'
alias mcint='mvn clean install -DskipUnitTests=true -DskipItTests=true -Dmaven.test.skip=true'
alias mt='mvn test'
alias mtt='mt | tee test_output.log'
alias mvt='mvn verify | tee test_output.log'

# Mongo
alias mongoup='mongod --config /usr/local/etc/mongod.conf'

# Node
alias ni='npm install'
alias nis='npm install --save'
alias nisd='npm install --save-dev'

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

# tmux
alias ta='tmux attach -t'
alias tls='tmux ls'
alias tns='tmux new -s'
alias tks='tmux kill-session -t'
alias tat='tmux new-session -As "$(basename "$PWD" | tr . -)"'

# Network Utils
alias flushdns='sudo killall -HUP mDNSResponder'
alias bouncenet='sudo ifconfig en0 down;sudo ifconfig en0 up'
alias wifi='networksetup -setairportpower en0'
alias checkvpn='route get 0/1 && route get 128.0/1'

# git
alias gpr='git pull --rebase'
alias gcot='git checkout -t'
alias gw='git add --all . && git commit -m 'WIP' && git push'
alias gwip="git add --all . && git commit -m 'WIP'"
alias patch='git format-patch HEAD^ --stdout > patch.diff'
alias sync='git add -u . && git commit -m "Minor changes. Commit message skipped." && repush'
alias repush="gpr && git push"
alias gsfba='git submodule foreach git branch'
alias gsfnm='git submodule foreach git branch | grep -v "* master"'
alias gcd='git checkout dev'
alias gsp='git stash pop'
alias gs='git stash'
alias gscfn='gsfe git clean -fxdn'
alias gscf='gsfe git clean -fxd'
alias gdt='git difftool'
alias gmt='git mergetool'
alias grbs='git rebase --skip'
alias gsui='git submodule update --init'
alias gib='git init --bare'
alias glm='ls -al `git status | grep modified | cut -d":" -f2`'

# ionic
alias iri='ionic run ios -l -c -s'
alias iei='ionic run ios -l -c -s'

# Bundler
alias b="bundle"
alias bake='bundle exec rake'
alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'
alias rebi='bundle install && !!'

# Tests and Specs
alias t="bundle exec rspec"
alias cuc="bundle exec cucumber"
alias ber="bundle exec rspec"

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

# Oddz
alias ods-lock='gsfe --recursive mvn versions:set; gsfe --recursive mvn versions:resolve-ranges versions:update-properties'
alias ods-revert='gsfe --recursive mvn versions:revert'

# Process management
alias pj='ps aux | grep java'
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

function es() { subl "${1:-.}"; }

# Include custom aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local
