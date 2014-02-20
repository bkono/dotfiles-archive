# Path to your oh-my-zsh configuration.
# ZSH=$HOME/.dotfiles/.oh-my-zsh

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
  ls -al
}

# Save a ton of history
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

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
#
# vi mode
bindkey "^F" vi-cmd-mode

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# plugins=(brew bundler gem heroku node npm osx mvn sublime)
# plugins=(ruby brew bundler gem heroku node npm osx svn rake rbenv mvn sublime)

# source $ZSH/oh-my-zsh.sh

# completion
autoload -U compinit
compinit

# Source my custom files after oh-my-zsh so I can override things.
for alias in ~/.zsh/aliases/*.zsh; do
  source $alias
done
#source $HOME/.dotfiles/zsh/aliases

for function in ~/.zsh/functions/*.zsh; do
  source $function
done
#source $HOME/.dotfiles/zsh/functions

for script in ~/.zsh/lib/*.zsh; do
  source $script
done

source ~/.githelpers

# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# Customize to your needs...
export PATH=./bin:/usr/local/bin:/usr/local/sbin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:~/lib/play/current

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home"
export JAVA_OPTS="-Xms2048M -Xmx6144M -XX:MaxPermSize=6144M"
export MAVEN_OPTS=${JAVA_OPTS}
export M2_HOME="/usr/local/Cellar/maven30/3.0.5/libexec"
export SBT_OPTS=${JAVA_OPTS}
export EDITOR='subl -w'
export COPYFILE_DISABLE=true
export ANDROID_HOME="/Users/bkonowitz/lib/adt/current/sdk"
export JETTY_HOME="/Users/bkonowitz/servers/jetty/current"

## Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# must come after the local config sourcing to allow RBENV to be set there
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# Shaves about 0.5s off Rails boot time (when using perf patch). Taken from https://gist.github.com/1688857
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
