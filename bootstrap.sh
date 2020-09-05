#!/bin/bash   

PROMPT='abstractmachines-bootstrap '

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

return
}

# ***** *****  utils ***** *****

noAction () {
    echo " * No action taken! Quitting now. *"
    exit 1
}

fallThrough () {
    echo " * No action taken; skipping this step! *"
}

proceedOrQuit () {
    echo "\n** Proceed? Or quit? (y/n) **"
    read yOrN
    if [[ $yOrN =~ [y|Y] ]]; then
        return
    else 
        noAction
    fi

    false
}

proceedOrSkip () {
    echo "\n** Proceed or Skip? ( y = proceed ... n = skip) **"
    read yOrN
    if [[ $yOrN =~ [y|Y] ]]; then
        return
    else 
        fallThrough # TODO Check v. false
    fi

    false # TODO Check v. fallThrough
}

# ***** *****  bootstrap scripts ***** *****

init () {
    hi
    echo "$PROMPT Let's bootstrap your machine!"

    return
}


# man ln: make links. ln w opt -s makes symlinks; w/ opt v, verbosely.
# RE: conditionals and square brackets in shell scripting:
# Single brackets are a test command; double brackets are syntax. Mostly unary operators?
# https://unix.stackexchange.com/questions/32210/why-does-parameter-expansion-with-spaces-without-quotes-work-inside-double-brack
symlinx () {
    echo "$PROMPT \n\n ** Symlinking dotfiles repo to HOME directory ... **"

    if proceedOrQuit; then
        if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo "\n ... Symlinking zshrc"
            ln -sv "$PWD/.zshrc" "$HOME/.zshrc"
        fi
        if [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
            echo "\n ... Symlinking bashrc"
            ln -sv "$PWD/.bashrc" "$HOME/.bashrc"
        fi

        ln -sv "$PWD/.bash_profile" "$HOME/.bash_profile"

        # loop through dotfiles in utils. These are imported into (sourced by) bash_profile.   
        mkdir $HOME/cli-utils
        for file in $( ls -a $PWD/cli-utils ) ; do
            ln -sv "$PWD/cli-utils/$file" "$HOME/cli-utils"
        done

        # loop through gitconfig and gitignore in this diretory

    fi

    return
}

# brewInstall: sniffs out what operating system the computer has - if Darwin, homebrew
# These dotfiles do not cover the apt/Linux/Debian package managers, or Windows. Only Mac.
brewInstall () {
    if [ $( echo $OSTYPE | grep 'darwin' ) ] ; then
        echo "$PROMPT \n\n ** Installing OSX's Homebrew package manager. **"

        if proceedOrSkip; then
            sh brew.sh
        fi
    else
        echo " ** You're not on Mac/OSX. You'll have to use different dotfiles (for now) for package management.** "
        noAction
    fi

    return
}

nvmInstallNodeVersions () {
    arg1=$1
    echo "\n\n Installing Node $arg1"

    # nvm is a shell function, so let's source it to make it available to us:
    . ~/.nvm/nvm.sh
    nvm install $arg1
}

nvmList () {
    echo "\n\n ** Here are the versions of Node you have installed with nvm. ** "
    nvm ls
}

nvmUseSetDefault () {
    nvmList
    echo "\n\n ** Which version of Node would you like to use right now? (Use integers / whole numbers, like 10, or 9). ** "
    read nvmUse
    nvm use $nvmUse
    node -v
    # status=$?
    # if [ $status -ne 0 ]; then
    #     echo "\n\n ** Whoops, that version isn't installed yet. Would you like to install it? **"
    #     if proceedOrSkip; then 
    #         nvm install $nvmUse
    #     fi
    # fi

    # echo "\n\n ** Would you like to set the default Node version with nvm? ** "
    # if proceedOrSkip; then
    #     echo "\n\n ** What version should be the default? (10, 12, etc) ** "
    #     read setDefault
    #     nvm alias default $setDefault
    #     nvm use $setDefault
    #     return
    # fi

    # return
}

nvmInstallFollowup () {
    # nvm is a shell function, so let's source it to make it available to us:
    . ~/.nvm/nvm.sh
    nvmList

    echo "\n\n ** Now that nvm is installed, let's install Node versions with it. ** "
    if proceedOrSkip; then
        echo "\n\n ** Which version of Node would you like nvm to install? (10, 12, etc) ** "
        read nvmVersion
        nvmInstallNodeVersions $nvmVersion
        # TODO Version '110' not found
    else
        echo "\n\n Skipping install of Node."
    fi

    echo "\n\n ** Let's finish our Node/nvm setup by setting default versions and what to use. **"
    nvmUseSetDefault

    echo "\n\n ** ... To install more versions of Node with nvm later, use the nvm install <version> command.** "
}

nvmInstall () {
    echo "$PROMPT \n\n ** Installing nvm via cURL (homebrew installation is not supported) ... **"

    if proceedOrSkip; then
        if [ -d "/path/to/dir" ]; then
            echo "\n\n ** nvm is already installed."
            # The nvm scripts do not copy nvm source scripts twice into bash profile.
        else 
            curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
        fi
    fi

    nvmInstallFollowup
    return
}

# gitCompletion() : autocomplete branch names on CLI
gitCompletion () {
    echo "$PROMPT \n\n ** Now installing, Bash/zsh autocompletion (branch name in CLI) **"

    if proceedOrSkip; then
        curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
    fi
}

# mostly just to ensure scripts are fallthru but also help the user
echoExit () {
    echo "\n\n done"
}

init
# symlinx
# brewInstall
nvmInstall
# gitCompletion
echoExit
