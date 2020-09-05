#!/bin/bash

PROMPT='abstractmachines-bootstrap-brew'

brewInstall () {
  echo "\n ** Checking to see if Homebrew is installed ... ** "
  which brew
  status=$?

  if [[ $status =~ 0 ]]; then 
    echo "Homebrew is already installed."
    return
  fi

  if [[ $status =~ 1 ]]; then 
    echo "\n ** Homebrew is not yet installed. Installing now! **"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    return
  fi
}

brewFresh () {
  echo "\n\n\n ** Let's make fresh brew! Running upgrades ... ** "
  brew update
  brew upgrade
  brew install coreutils

  return
}

brewDarwin () {
  echo "\n\n\n ** Let's brew up some OSX installs! ** "

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

  return
}

brewInstall
brewFresh
brewDarwin
brew cleanup
