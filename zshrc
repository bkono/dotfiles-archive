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

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

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

# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OF" end-of-line
bindkey ' ' magic-space    # also do history expansion on space

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey '^[[Z' reverse-menu-complete

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

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
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:~/lib/play/current

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home"
export JAVA_OPTS="-Xms2048M -Xmx6144M -XX:MaxPermSize=6144M"
export MAVEN_OPTS=${JAVA_OPTS}
export M2_HOME="/usr/local/Cellar/maven/3.1.1/libexec"
export SBT_OPTS=${JAVA_OPTS}
export EDITOR='subl -w'
export COPYFILE_DISABLE=true
export ANDROID_HOME="/Users/bkonowitz/lib/adt/current/sdk"
export JETTY_HOME="/Users/bkonowitz/servers/jetty/current"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

source ~/.zlogin

## Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# must come after the local config sourcing to allow RBENV to be set there
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

# Shaves about 0.5s off Rails boot time (when using perf patch). Taken from https://gist.github.com/1688857
export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
