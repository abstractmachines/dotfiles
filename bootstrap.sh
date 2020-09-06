#!/bin/bash

PROMPT="\n\n** "

hi () {
    echo "\n\n\n *** DOTFILES KITTEH ***

::::::::::::::::::::::::::::::::::::::::::::::::::::
##??????????????????  ;;;;  ?????##  ::  ;;;;  :::::
##??????????()??????  ;;;;;;?????##    ;;;;;;  :::::
##??????????????????  ;;;;;;         ;;;;;;;;  :::::
##??????????????????  ;;;;;;;;;;;;;;;;;;;;;;;  :::::
##????????????()??  ;;;;;;;;;;;;;;;;;;;;;;;;;;;  :::
##??()????????????  ;;;;;;@@  ;;;;;;; @@  ;;;;;  :::
##????????????????  ;;;;;;;; ::: • • ::: ;;;;;;;  ::
####??????()??????  ;;[];;;;;;;;;;;;;;;;;;;;;[]  :::
######?????????????  ;;;;;; \/\/\/\/\/\/ ;;;;  :::::
######?????????????  ;;;;;; _/\/\/\/\/\_ ;;;;  :::::
::::::::::::::::::::::::::::::::::::::::::::::::::::
\n"
}

init () {
    hi
    echo "$PROMPT Let's bootstrap your machine! ** "
}

symlinx () {
    echo "$PROMPT Symlinking dotfiles repo to HOME directory ... **"

    ln -sv "$PWD/.bash_profile" "$HOME/.bash_profile"

    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        ln -sv "$PWD/.zshrc" "$HOME/.zshrc"
    fi
    if [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        ln -sv "$PWD/.bashrc" "$HOME/.bashrc"
    fi

    mkdir $HOME/cli-utils
    for file in $( ls -a $PWD/cli-utils ) ; do
        ln -sv "$PWD/cli-utils/$file" "$HOME/cli-utils"
    done

    # TODO loop through gitconfig and gitignore in this diretory

    echo "$PROMPT Your symlinks are now complete. Here's HOME dir: **\n\n"
    ls -al ~/
}

gitCompletion () {
    echo "$PROMPT Installing git CLI autocomplete and git branch prompt (for zsh) ... **"
    curl -o ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
    mkdir ~/.zsh
    curl -o ~/.zsh/git-completion.zsh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
    cp ~/.zsh/git-completion.zsh ~/.zsh/_gitcompletion
    curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
}

brewInstall () {
    if [ $( echo $OSTYPE | grep 'darwin' ) ] ; then
        sh brew.sh
    else
        echo "$PROMPT You're not on Mac/OSX. You'll have to use different dotfiles (for now) for package management.** "
        exit 1
    fi
}

nvmInstallNodeVersions () {
    nvm install $1
}

nvmList () {
    echo "$PROMPT Local versions of Node ** "
    nvm ls
}

nvmDefault () {
    nvm alias default $1
    touch ~/.nvmrc
    echo "$1" > ~/.nvmrc
    # nvm use
}

nvmInstallFollowup () {
    # nvm is a shell function, so let's source it to make it available to us:
    . ~/.nvm/nvm.sh
    
    nvmList

    echo "$PROMPT Enter which Node version you'd like nvm to install & set as default.** "
    read nvmVersion
    nvmInstallNodeVersions $nvmVersion
    nvmDefault
}

nvmInstall () {
    echo "$PROMPT Installing nvm via cURL (homebrew installation is not supported) ... **"

    if [ -d "$HOME/.nvm" ]; then
        echo "$PROMPT nvm is already installed."
        # The nvm scripts do not copy nvm source scripts twice into bash profile.
    else 
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
    fi

    nvmInstallFollowup
}

# mostly just to ensure scripts are fallthru but also help the user
echoExit () {
    echo "$PROMPT Done."
}

init
symlinx
gitCompletion
brewInstall
nvmInstall
echoExit

# unset init, symlinx ...
