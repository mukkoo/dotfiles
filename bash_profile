if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion.d/wp-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/wp-completion.bash
fi

source $HOME/.bashrc
source $HOME/.profile

# MYSQL=/usr/local/mysql/bin
MYSQL=/usr/local/opt/mysql@5.5/bin
export PATH=$MYSQL:$PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

export PATH=/usr/local/bin:$PATH
source /usr/local/bin/wp-completion.bash

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
export PGHOST=localhost

# load up rbenv
[ -f `which rbenv` ] && eval "$(rbenv init -)"
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

export PATH="/usr/local/opt/openssl/bin:$PATH"

export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
