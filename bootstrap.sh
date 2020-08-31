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
    echo "$PROMPT Let's bootstrap your machine!"

    if proceed; then
        symlinx
    fi
}

noAction () {
    echo " * No action taken. *"
    exit 0
}

# proceed: uses regex and the nature of bash (exit status of last cmd) to continue
# ($?) Expands to the exit status of the most recently executed foreground pipeline:  
# https://www.gnu.org/software/bash/manual/bash.html#index-_0024_003f
# re: https://stackoverflow.com/questions/5431909/returning-a-boolean-from-a-bash-function
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

# man ln: make links. ln w opt -s makes symlinks; w/ opt v, verbosely.
symlinx () {
    echo "$PROMPT \n\n ** Symlinking dotfiles repo to HOME directory. **"

    if proceed; then
        echo "\n\n ** Script now symlinking this repo's bashprofile file, to home dir **\n\n"
        ln -sv "$PWD/.bash_profile" "$HOME/.bash_profile"
    fi
}

# brewinstall: sniffs out what operating system the computer has (the Mac 
# OSX OS is a Unix-like OS called [Darwin](https://en.wikipedia.org/wiki/Darwin_(operating_system)) 
# that's *mostly* POSIX-compliant.) The script checks if output _exists_ from 
# printing out the operating system and [grepping for](https://man7.org/linux/man-pages/man1/grep.1.html)
# the darwin OS.
brewinstall () {
    if [ $( echo $OSTYPE | grep 'darwin' ) ] ; then
        echo "$PROMPT \n\n ** Installing OSX's Homebrew package manager. **"

        if proceed; then
            # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
            sh brew.sh
        fi
    else
        echo " ** You're not on Mac/OSX. You'll have to use different dotfiles (for now). ** "
        noAction
    fi
}

init
brewinstall
