#!/bin/bash

PROMPT="\n\n** "

brewInstall () {
  echo "$PROMPT Installing OSX's Homebrew package manager. **"

  which brew
  status=$?
  if [[ $status =~ 1 ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
}

brewFresh () {
  brew update
  brew upgrade
  # GNU Core Utilities
  brew install coreutils
  # brew install bash
  # brew install wget

}

brewDarwin () {
  brew install docker
  brew install fzf
  brew install gdb
  brew install go
  brew install htop
  brew install mysql
  brew install node
  # brew install nvm # unsupported by homebrew. https://github.com/nvm-sh/nvm
  brew install python
  brew install screenfetch
  brew install tmux
  brew install tree
}

# mongodb has been removed from homebrew core because its licensing changed:
# https://stackoverflow.com/questions/57856809/installing-mongodb-with-homebrew
brewMongo () {
  brew tap mongodb/brew
  brew install mongodb-community
  brew services start mongodb-community
}

brewUninstall () {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)"
}

brewInstall
brewFresh
brewDarwin

# remove outdated versions from Cellar 
brew cleanup

echo "$PROMPT Homebrew packages: **"
brew list
