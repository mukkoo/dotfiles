if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion.d/wp-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/wp-completion.bash
fi

source $HOME/.bashrc
source $HOME/.profile

MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

export PATH=/usr/local/bin:$PATH
source /usr/local/bin/wp-completion.bash

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
