#!/bin/bash

PROMPT='abstractmachines-bootstrap'

init () {

	echo "$PROMPT Let's bootstrap your machine."
}

# man ln: make links. ln w opt -s makes symlinks; w/ opt v, verbosely.
symlinx () {
    echo "$PROMPT \n\n ** Symlinking your dotfiles repo to your user directory. ** \n\n Proceed? (y/n)"
	read inp
	if [ "$inp" = 'y' -o "$inp" = 'Y' ] ; then
        echo "okay dude"
        for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md|LICENSE|terminal' ) ; do
			ln -sv "$PWD/$file" "$HOME"
		done

    else
        echo "never mind"
    fi
}

init
symlinx
# brewinstall
# etc