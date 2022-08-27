#!/bin/bash

PROMPT="\n\n** "

brewInstall () {
  echo "$PROMPT Installing OSX's Homebrew package manager. **"

  which brew
  status=$?
  if [[ $status =~ 1 ]]; then
    # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

brewFresh () {
  brew update
  brew upgrade
  # disable telemetry:
  brew analytics off
}

brewDarwin () {
  # GNU Core Utilities
  brew install coreutils
  # ***** Installing latest bash to avoid Apple's GPLv3 *****
  # If you run `bash --version` on your mac, you'll see it says "2007."
  # Apple doesn't ship latest bash, because it's GPLv3; as we want a recent
  # version of bash for our scripts, let's use brew to get a more updated bash:
  brew install bash
  # brew install docker # 1.
  # brew install docker-engine # 2. (and 3. VM/hypervisor)
  brew cask install docker # GUI Docker app
  brew install fzf
  brew install gdb
  brew install gnupg
  brew install go
  brew install golangci-lint
  brew cask install google-cloud-sdk # gcloud cli
  brew install helm
  brew install htop
  brew install jq
  brew install kind
  brew install kubectl
  brew install kubectx
  brew install kubens
  brew install kustomize
  brew install minikube
  brew install mysql
  brew install node
  # brew install nvm # unsupported by homebrew. https://github.com/nvm-sh/nvm
  brew install postgresql@12
  brew install python
  # python@3.7 is keg-only, which means it was not symlinked into /usr/local,
  # because this is an alternate version of another formula.
  # If you need to have python@3.7 first in your PATH, run:
  # echo 'export PATH="/usr/local/opt/python@3.7/bin:$PATH"' >> ~/.zshrc
  brew install python@3.7 # Usage is then python3
  brew install python@3.8
  brew install redis
  brew install screenfetch
  brew install tmux
  brew install tree
  brew install wget
  brew install yarn
}

addBrewBashToEtcShells () {
  bashLatestGPLv3=$(which bash)
  # /etc/shells : list of valid login shells for system. apps consult /etc/shells.
  # So, this will append the brew-installed latest bash to your list of valid shells:
  echo $bashLatestGPLv3 | sudo tee -a /etc/shells
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
addBrewBashToEtcShells

# remove outdated versions from Cellar 
brew cleanup

echo "$PROMPT Homebrew packages: **"
brew list
