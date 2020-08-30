#!/bin/bash

PROMPT='abstractmachines-bootstrap'

hi () {
    echo "
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
    echo "$PROMPT Let's bootstrap your machine."
}

# man ln: make links. ln w opt -s makes symlinks; w/ opt v, verbosely.
symlinx () {
    echo "$PROMPT \n\n ** Symlinking your dotfiles repo to your user directory. ** \n\n Proceed? (y/n)"
    read inp
    if [ "$inp" = 'y' -o "$inp" = 'Y' ] ; then

        echo "\n\n** Bootstrap script now symlinking this repo's bashprofile file, to your home dir's bash profile **\n\n"
        ln -sv "$PWD/.bash_profile" "$HOME/.bash_profile"

    else
        echo "\n* no action taken ...Or something went wrong during symlinx(). *"
    fi
}

# `brewinstall()` sniffs out what operating system the computer has (the Mac 
# OSX OS is a Unix-like OS called [Darwin](https://en.wikipedia.org/wiki/Darwin_(operating_system)) 
# that's *mostly* POSIX-compliant.) The script checks if output _exists_ from 
# printing out the operating system and [grepping for](https://man7.org/linux/man-pages/man1/grep.1.html)
# the darwin OS.
brewinstall () {
    if [ echo $OSTYPE | grep darwin ] ; then
        echo "Using OSX, and installing homebrew package manager. \n\n Continue? Y/N."
        read inp
    else
        echo "Nevermind, you're not on Mac OS."
    fi
}

init
symlinx
# brewinstall
# etc