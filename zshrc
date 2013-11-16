# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="bkon"
# ZSH_THEME="robbyrussell"

# Never know when you're gonna need to popd!
setopt AUTO_PUSHD
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Show contents of directory after cd-ing into it
chpwd() {
  # ls -lrthG
  ls -al
}

# Save a ton of history
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

# automatically enter directories without cd
setopt auto_cd

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

plugins=(ruby brew bundler gem heroku node npm osx svn rake rbenv mvn sublime)

source $ZSH/oh-my-zsh.sh

# Source my custom files after oh-my-zsh so I can override things.
for alias in ~/.zsh/aliases/*.zsh; do
  source $alias
done
#source $HOME/.dotfiles/zsh/aliases

for function in ~/.zsh/functions/*.zsh; do
  source $function
done
#source $HOME/.dotfiles/zsh/functions

# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:~/lib/play/current

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home"
export JAVA_OPTS="-Xms2048M -Xmx6144M -XX:MaxPermSize=6144M"
export MAVEN_OPTS="-Xms2048M -Xmx6144M -XX:MaxPermSize=6144M"
#export M2_HOME="/usr/local/Cellar/maven30/3.0.5/libexec"
export M2_HOME="/usr/local/Cellar/maven/3.1.0/libexec"
# export M2_HOME="/usr/share/maven/"
export EDITOR='subl -w'
export COPYFILE_DISABLE=true
# export RBENV_ROOT=/usr/local/Cellar/rbenv/0.4.0/
export RBENV_ROOT=/usr/local/var/rbenv/
export ANDROID_HOME="/Users/bkonowitz/lib/adt/current/sdk"
export JETTY_HOME="/Users/bkonowitz/Servers/jetty"

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# Shaves about 0.5s off Rails boot time (when using perf patch). Taken from https://gist.github.com/1688857
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000


## original from thoughtbot


# vi mode
# bindkey -v
bindkey "^F" vi-cmd-mode
# bindkey jj vi-cmd-mode
#
## expand functions in the prompt
#setopt prompt_subst
#
## prompt
# export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '
#
## ignore duplicate history entries
#setopt histignoredups
#
## keep TONS of history
#export HISTSIZE=4096
#
## look for ey config in project dirs
#export EYRC=./.eyrc
#
## automatically pushd
#setopt auto_pushd
#export dirstacksize=5
#
## awesome cd movements from zshkit
#setopt AUTOCD
#setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
#setopt cdablevars

# Try to correct command line spelling
#setopt CORRECT CORRECT_ALL
#
## Enable extended globbing
#setopt EXTENDED_GLOB
#
## aliases
#[[ -f ~/.aliases ]] && source ~/.aliases
#
## Local config
#[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
