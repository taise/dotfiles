# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
ZSH_THEME="cloud"

DEFAULT_USER="user@hostname"
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
plugins=(rails ruby git)

export LANG=en_US.UTF-8
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -G'
alias today='mkdir `date +"%Y%m%d"`'
#export SCREENDIR="/Users/taise/.screen"
alias vim='/usr/local/bin/vim'
alias musicmuit='cd /Users/taise/development/ruby/rails_apps/musicmuit'

# for Ruby
[ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
alias r='rails'
alias rspec='rspec --color'
alias rspecf='rspec --color --format doc'
alias be='bundle exec'
alias bi='bundle install'
alias gi='gem install --no-ri --no-rdoc'

# for MySQL
MYSQL=/usr/local/mysql/bin
PATH=$PATH:$MYSQL

#for PostgreSQL
export PGDATA=/usr/local/var/postgres
alias ps_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias ps_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias ps_status='pg_ctl -D /usr/local/var/postgres status'

#for JavaScript
PATH=$PATH:/usr/local/share/npm/bin

#cat /Users/taise/Documents/todo.txt

# for Julia
export PATH=$PATH:/Applications/Julia-0.2.1.app/Contents/Resources/julia/bin

# for python
export PATH=$PATH:/usr/local/lib/python3.3/site-packages

# for Scala
export SPARK_HOME='/Users/taise/development/scala/spark-0.9.1'
