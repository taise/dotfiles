# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
ZSH_THEME="cloud"
TERM=xterm-256color

DEFAULT_USER="taise"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

LANG=en_US.UTF-8
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
UPDATE_ZSH_DAYS=3

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# For zsh-completions
# fpath=(/usr/local/share/zsh-completions $fpath)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails ruby rake git emoji-clock zsh-syntax-highlighting docker aws
         brew bundler gem golang pep8 pip python tmux vagrant)

source $ZSH/oh-my-zsh.sh
#if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
#  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#fi

# git
alias gmergedrm="git branch --merged | grep -v '*' | xargs -I % git branch -d %"
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

# for homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Customize to your needs...
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -G'
alias today='mkdir `date +"%Y%m%d"`'
alias todaymd='touch `date +"%Y%m%d.md"`'

# for Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias r='rails'
alias rspec='rspec --color'
alias rspecf='rspec --color --format doc'
alias be='bundle exec'
alias bers='bundle exec rspec -c -f d'
alias bi='bundle install'
alias gi='gem install --no-ri --no-rdoc'

# for MySQL
export MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL

#for PostgreSQL
export PGDATA=/usr/local/var/postgres
alias ps_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias ps_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias ps_status='pg_ctl -D /usr/local/var/postgres status'

#for JavaScript
export PATH=$HOME/.nodebrew/current/bin:$PATH

# for Java
alias java='/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/java'

# for python
export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(pyenv init -)"

# for perl
# eval "$(plenv init -)"

# for Scala
export PATH="${HOME}/.scalaenv/bin:${PATH}"
eval "$(scalaenv init -)"
unset SPARK_HOME

# for peco
alias o='vim $(git ls-files | peco)'

function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(\history -n 1 | \
    eval $tac | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# for yosemite
alias dns_clear='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# restart docker
alias dk_rm="docker ps -a | tail -1 | grep -v CONTAINER | cut -d' ' -f1 |xargs docker rm "
alias dk_run="docker run -it -p 43210:22 -p 3000:3001 -p 8000:8001 -v `pwd`:/usr/local/recipe-repo centos:chef-sandbox"

# Go
export GOPATH=$HOME/dev/go
export GOROOT=$(brew --prefix go)/libexec
export PATH=$GOPATH/bin:$PATH

# td-agent
alias td-agent='sudo launchctl start td-agent'
