# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
ZSH_THEME="cloud"

DEFAULT_USER="taise515@gmail.com"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails ruby git zsh-syntax-highlighting zsh-notify)
setopt nolistbeep

export LANG=en_US.UTF-8
source $ZSH/oh-my-zsh.sh
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# for homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Customize to your needs...
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -G'
alias today='mkdir `date +"%Y%m%d"`'
#export SCREENDIR="/Users/taise/.screen"
alias vim='/usr/local/bin/vim'

# notify
REPORTTIME=3

# Anyenv
export PATH=$HOME/.anyenv/env/rbenv/bin:$PATH
eval "$(rbenv init - zsh)"


# for Perl
PERL_MB_OPT="--install_base \"/Users/taise/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/taise/perl5"; export PERL_MM_OPT;

# for Ruby
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"
alias r='rails'
alias rspec='rspec --color'
alias rspecf='rspec --color --format doc'
alias be='bundle exec'
alias bi='bundle install'
alias gi='gem install --no-ri --no-rdoc'

# for MySQL
MYSQL=/usr/local/mysql/bin
PATH=$PATH:$MYSQL

# for Apache
export PATH=/usr/local/Cellar/httpd/2.2.27/sbin:$PATH

#for PostgreSQL
export PGDATA=/usr/local/var/postgres
alias ps_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias ps_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias ps_status='pg_ctl -D /usr/local/var/postgres status'

#for JavaScript
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$HOME/.nodebrew/current/bin:$PATH


#cat /Users/taise/Documents/todo.txt

# for Julia
export PATH=$PATH:/Applications/Julia-0.3.0.app/Contents/Resources/julia/bin

# for Scala
export SPARK_HOME='/usr/local/spark/spark-1.1.1'
PATH="$PATH:$SPARK_HOME/bin"
export SBT_OPTS='-Xms512M -Xmx3072M -Xss256M -XX:+UseParNewGC -XX:+UseConcMarkSweepGC'

# for PlayFramework
alias a='activator'

# for Python
export PATH="$HOME/.anyenv/env/pyenv/bin:$PATH"
eval "$(pyenv init -)"

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

