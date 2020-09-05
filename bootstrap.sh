#!/bin/bash   

PROMPT='abstractmachines-bootstrap'

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
        fallThrough
    fi

    false # skip
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

# brewInstall: sniffs out what operating system the computer has (the Mac 
# OSX OS is a Unix-like OS called [Darwin](https://en.wikipedia.org/wiki/Darwin_(operating_system)) 
# that's *mostly* POSIX-compliant.) The script checks if output _exists_ from 
# printing out the operating system and [grepping for](https://man7.org/linux/man-pages/man1/grep.1.html)
# the darwin OS.
brewInstall () {
    if [ $( echo $OSTYPE | grep 'darwin' ) ] ; then
        echo "$PROMPT \n\n ** Installing OSX's Homebrew package manager. **"

        if proceedOrQuit; then
            sh brew.sh
        fi
    else
        echo " ** You're not on Mac/OSX. You'll have to use different dotfiles (for now) for package management.** "
        noAction
    fi

    return
}

nvmInstallNode () {
    arg1=$1
    echo "\n\n Installing Node $arg1"

    # nvm is a shell function, so let's source it to make it available to us:
    . ~/.nvm/nvm.sh
    nvm --version
    nvm install $arg1

    nvmInstallContinue # a bit circular, but less stiff than a do-while loop.
}

nvmInstallContinue () {
    echo "\n\n ** Would you like to also [continue to] install (one or more) node versions, with nvm? ** "
    if proceedOrSkip; then
        echo "\n\n ** Which version of npm would you like nvm to install? (10,12, etc) ** "
        read nvmVersion
        nvmInstallNode $nvmVersion
    fi

    return
}

nvmInstall () {
    echo "$PROMPT \n\n ** Installing nvm via cURL (homebrew installation is not supported) ... **"

    if [ -d "/path/to/dir" ]; then
        echo "\n\n ** nvm is already installed."
        # The nvm scripts do not copy nvm source scripts twice into bash profile.
    else 
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
    fi

    nvmInstallContinue
}

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
symlinx
brewInstall
nvmInstall
gitCompletion
echoExit

