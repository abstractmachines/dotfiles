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

init () {
    hi
    echo "$PROMPT Let's bootstrap your machine!"

    if proceed; then
        symlinx
    fi

    return
}

noAction () {
    echo " * No action taken. *"
    exit 1
}

fallThrough () {
    echo " * No action taken; skipping this step! *"
}

proceed () {
    echo "\n** Proceed? (y/n) **"
    read yOrN
    if [[ $yOrN =~ [y|Y] ]]; then
        return
    else 
        noAction
    fi

    false
}

proceedAndSkip () {
     echo "\n** Proceed or Skip? ( y = proceed ... n = skip) **"
    read yOrN
    if [[ $yOrN =~ [y|Y] ]]; then
        return
    else 
        fallThrough
    fi

    false # skip
}

# man ln: make links. ln w opt -s makes symlinks; w/ opt v, verbosely.
# RE: conditionals and square brackets in shell scripting:
# Single brackets are a test command; double brackets are syntax. Mostly unary operators?
# https://unix.stackexchange.com/questions/32210/why-does-parameter-expansion-with-spaces-without-quotes-work-inside-double-brack
symlinx () {
    echo "$PROMPT \n\n ** Symlinking dotfiles repo to HOME directory. **"

    if proceed; then
        echo "\n\n ** Script now symlinking dotfiles to your HOME directory. **\n\n"

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

        if proceed; then
            sh brew.sh
        fi
    else
        echo " ** You're not on Mac/OSX. You'll have to use different dotfiles (for now) for package management.** "
        noAction
    fi

    return
}

nvmInstallNode () {
    echo "hey"
}

nvmInstall () {
    echo "$PROMPT \n\n ** Installing nvm via cURL (homebrew installation is not supported) ... **"

    if [ -d "/path/to/dir" ]; then
        echo "\n\n ** nvm is already installed."
        # The nvm scripts do not copy nvm source scripts twice into bash profile.
    else 
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
    fi

    echo "\n\n ** Which version of npm would you like nvm to install? (10,12, etc) ** "
    read nvmV1

    # nvm is a shell function, so let's source it to make it available to us:
    . ~/.nvm/nvm.sh
    nvm --version
    nvm install $nvmV1

    echo "\n\n ** Would you like to install a second Node version as well? ** "
    if proceedAndSkip; then
        echo "\n\n Tell us teh version"
        read nvmV2
        nvm install $nvmV2
        # all of this should be in nvmInstallNode with $arg1 as version.
    fi

}

# init
# brewInstall
nvmInstall
# nvmInstallNode # proves we are skipping over nvmInstall stuff.
