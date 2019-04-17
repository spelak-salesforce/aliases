# Add any tools to PATH
PATH=$PATH:~/tools

# git completed
source ~/git/git-completion.bash

# Create virtualenv for cci:  
# See https://cumulusci.readthedocs.io/en/latest/tutorial.html#part-1-installing-cumulusci
source ~/cci/bin/activate

# Github SSH key for CumulusCI
export CUMULUSCI_KEY=voz6r9ezAPNsu7IY

# libffi is keg-only, which means it was not symlinked into /usr/local,
# because some formulae require a newer version of libffi.
export LDFLAGS="-L/usr/local/opt/libffi/lib"

# Aliases
source $HOME/.aliases

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
