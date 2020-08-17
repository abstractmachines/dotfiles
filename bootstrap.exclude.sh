#!/bin/bash

PROMPT='abstractmachines-bootstrap'

init () {

	echo "$PROMPT Let's bootstrap your machine."
}

symlinx () {
    echo "$PROMPT \n\n ** Symlinking your dotfiles repo to your user directory. ** \n\n Proceed? (y/n)"
	read inp
	if [ "$inp" = 'y' -o "$inp" = 'Y' ] ; then
        echo "okay dude"
    else
        echo "never mind"
    fi
}

init
symlinx
# brewinstall