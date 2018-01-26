## Prompt colors
red='\[\e[0;31m\]'
RED='\[\e[1;31m\]'
blue='\[\e[0;34m\]'
BLUE='\[\e[1;34m\]'
cyan='\[\e[0;36m\]'
CYAN='\[\e[1;36m\]'
black='\[\e[0;30m\]'
BLACK='\[\e[1;30m\]'
green='\[\e[0;32m\]'
GREEN='\[\e[1;32m\]'
yellow='\[\e[0;33m\]'
YELLOW='\[\e[1;33m\]'
magenta='\[\e[0;35m\]'
MAGENTA='\[\e[1;35m\]'
white='\[\e[0;37m\]'
WHITE='\[\e[1;37m\]'
NC='\[\e[0m\]'

function is_vim_running {
  jobs | grep -o 'vim' &> /dev/null
}

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"

PROMPT_INFO="${WHITE}[\A] ${GREEN}\u${WHITE}(${GREEN}\h${WHITE})${NC} ${BLUE}\w"

# PROMPT_NODE="[\$(nvm version)]"
PROMPT_RUBY="[\$(rbenv version | sed -e 's/ .*//')]"
PROMPT_GIT="${YELLOW}\$(__git_ps1)"
PROMPT_FOOTER="\n\$(is_vim_running && echo \"${RED}\" || echo \"${BLACK}\")↳ ${GREEN}\$ ${NC}"
BASH_STATUS='`if [[ $? == 0 ]]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi`'
PROMPT_DIRTRIM=3

PS1="\n${BASH_STATUS} ${PROMPT_INFO} ${PROMPT_RUBY} ${PROMPT_NODE} ${PROMPT_GIT} ${PROMPT_FOOTER}"

## Aliases

alias l='ls -CF'
alias ls='ls -hFG'
alias ll='ls -hFlG'
alias la='ls -lhAFG'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='colordiff'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -hc'
alias gi='git'

alias recent='ls -lhAFt --color=auto'
alias ports='netstat -tulanp'

alias hk='heroku'

# Expand aliases with sudo too
alias sudo='sudo '

# Security
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias chown='chown'
alias chmod='chmod'
alias chgrp='chgrp'

# Funny
alias mov2gif='~/.dotfiles/mov_to_gif.sh'

# Add an "alert" alias for long running commands.  Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

## Shopt options
shopt -s cdspell        # This will correct minor spelling errors in cd command.
shopt -s checkwinsize   # Check window size (rows, columns) after each command.
shopt -s cmdhist        # Save multi-line commands in history as single line.
shopt -s dotglob        # Include dotfile in path-name expansions.
shopt -s histappend     # Append to history rather than overwrite.
shopt -s nocaseglob     # Pathname expansion will be treated as case-insensitive.
shopt -s extglob        # Extended globbing expansion (see man bash -> Pathname Expansion - Pattern Matching)

## Bash completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

## Colored manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

## Exports
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL="ignoreboth"
export EDITOR="vim"

## Lampp
#export WP_CLI_PHP=/opt/lampp/bin/php
#export PATH=$PATH:/opt/lampp/bin

[[ -s "$HOME/.bunctionsh" ]] && source "$HOME/.bunctionsh"

# Personal functions definition
if [[ -f ~/.bunctionsh ]]; then
  source ~/.bunctionsh
fi

export PATH="/usr/local/bin:$PATH"

# Postgres
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
# Mysql
# export PATH="/usr/local/opt/mysql55/bin:$PATH"

### Use binstubs automatically, automagically, autorunningly
export PATH="./bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# GO
export PATH=$PATH:/usr/local/opt/go/libexec/bin

### Fix some problems w/ iTerm2 and binding.pry
export LC_CTYPE=it_IT.UTF-8
export LANG=it_IT.UTF-8
export LC_ALL=it_IT.UTF-8

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"

# Welaika works paths

# wordpress for wordmove
export WORDPRESS_WORKS_PATH="$HOME/Development/Works"

# Rails Last migration
function echo_last_migration {
  migrate_path='db/migrate/'
  nth_migration=$((${1:-0}+1))
  echo "${migrate_path}$(ls -1t $migrate_path | head -$nth_migration | tail -1)"
}

function last_migration {
  subl $(echo_last_migration $*)
}

# Smallpay
export SMALLPAY_DEV_ROOT="$HOME/Development/Works/seesaw"

# erlang
export ERL_AFLAGS="-kernel shell_history enabled"
