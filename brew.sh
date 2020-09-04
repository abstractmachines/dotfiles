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
    echo "Homebrew is not yet installed. Installing now!"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    return
  fi
}

brewFresh () {
  echo "Let's make fresh brew! Running upgrades ..."
  brew update
  brew upgrade
  brew install coreutils

  return
}

brewDarwin () {
  echo "Let's brew up some OSX installs!"

  brew install nvm
  brew install tmux
}

brewUninstall () {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)"

  return
}

brewInstall
brewFresh
brewDarwin