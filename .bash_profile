source ~/cli-utils/.alias
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# GNOME, jhbuild:
export PATH="~/.local/bin:$PATH"

# Rust, Cargo package manager:
export PATH="~/.cargo/bin:$PATH"

# Golang:
#export PATH="~/go/bin:$PATH"

# ***** nvm 
# if this already exists, nvm will skip appending it on installation (see bootstrap.sh):
# => nvm source string already in /Users/yourUser/.bash_profile
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/openjdk/bin:$PATH"

PS1="\W$ "

# git prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# git branch autocompletion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
