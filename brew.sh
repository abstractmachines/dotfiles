#!/bin/bash

PROMPT='abstractmachines-bootstrap-brew'

brewInstall () {
  echo "\n ** Checking to see if Homebrew is installed ... ** "
  which brew
  status=$?

  if [[ $status =~ 0 ]]; then 
    echo "Homebrew is already installed. Skipping."
    return
  fi

  if [[ $status =~ 1 ]]; then 
    echo "Homebrew is not yet installed. Installing now!"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    return
  fi
}

brewSetup () {
  brew update
  brew upgrade
  brew install coreutils

  brew install tmux

  return

}

brewUninstall () {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)"

  return
}

brewInstall
brewSetup