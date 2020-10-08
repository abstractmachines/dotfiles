source ~/cli-utils/.alias
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# ***** nvm 
# if this already exists, nvm will skip appending it on installation (see bootstrap.sh):
# => nvm source string already in /Users/yourUser/.bash_profile
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/openjdk/bin:$PATH"
