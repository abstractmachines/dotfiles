#!/bin/bash   

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
    echo "\n\n** No action taken! Quitting now. *"
    exit 1
}

fallThrough () {
    echo "\n\n** No action taken; skipping this step! *"
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
    echo "\n\n ** Let's bootstrap your machine! ** "
}

# symlinx() : the only mandatory part of this install (proceedOrQuit).
# man ln: make links. ln w opt -s makes symlinks; w/ opt v, verbosely.
# RE: conditionals and square brackets in shell scripting:
# Single brackets are a test command; double brackets are syntax. Mostly unary operators?
# https://unix.stackexchange.com/questions/32210/why-does-parameter-expansion-with-spaces-without-quotes-work-inside-double-brack
symlinx () {
    echo "\n\n ** Symlinking dotfiles repo to HOME directory ... **"

    if proceedOrQuit; then
        ln -sv "$PWD/.bash_profile" "$HOME/.bash_profile"

        if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo "\n ... Symlinking zshrc"
            ln -sv "$PWD/.zshrc" "$HOME/.zshrc"
        fi
        if [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
            echo "\n ... Symlinking bashrc"
            ln -sv "$PWD/.bashrc" "$HOME/.bashrc"
        fi

        # loop through dotfiles in utils. These are imported into (sourced by) bash_profile.   
        mkdir $HOME/cli-utils
        for file in $( ls -a $PWD/cli-utils ) ; do
            ln -sv "$PWD/cli-utils/$file" "$HOME/cli-utils"
        done

        # loop through gitconfig and gitignore in this diretory
        
    fi
}

# gitCompletion() : tab to autocomplete, and display branch names on CLI prompt
gitCompletion () {
    echo "\n\n ** Now installing, Bash/zsh autocompletion (branch name in CLI) **"

    if proceedOrSkip; then
        curl -o ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
        mkdir ~/.zsh
        curl -o ~/.zsh/git-completion.zsh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
        cp ~/.zsh/git-completion.zsh ~/.zsh/_gitcompletion
        curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
    fi
}

# brewInstall: sniffs out what operating system the computer has - if Darwin, homebrew
# These dotfiles do not cover the apt/Linux/Debian package managers, or Windows. Only Mac.
brewInstall () {
    if [ $( echo $OSTYPE | grep 'darwin' ) ] ; then
        echo "\n\n ** Installing OSX's Homebrew package manager. **"

        if proceedOrSkip; then
            sh brew.sh
        fi
    else
        echo "** You're not on Mac/OSX. You'll have to use different dotfiles (for now) for package management.** "
        noAction
    fi
}

nvmInstallNodeVersions () {
    nvm install $1
}

nvmList () {
    echo "\n\n** Here are the versions of Node you have installed with nvm. ** "
    nvm ls
}

nvmDefault () {
    nvmList

    echo "\n\n** Would you like to set the default Node version with nvm? ** "
    if proceedOrSkip; then
        echo "\n\n ** What version should be the default? (10, 12, etc) ** "
        read setDefault
        nvm alias default $setDefault
        touch ~/.nvmrc
        echo "$setDefault" > ~/.nvmrc
        # nvm use $setDefault ... TODO: Persist this outside of script to shell:
        # - grep around for the binary (using regex)in $HOME/.nvm/node/versions;
        # - find the proper binary (regex match w/ user input $setDefault), 
        # - add that to $PATH. `nvm use` is annoying, so just use it yo-self.
    fi
}

nvmInstallFollowup () {
    # nvm is a shell function, so let's source it to make it available to us:
    . ~/.nvm/nvm.sh
    
    nvmList

    echo "\n\n** Now that nvm is installed, let's install Node versions with it. ** "
    if proceedOrSkip; then
        echo "\n\n** Which version of Node would you like nvm to install? (10, 12, etc) ** "
        read nvmVersion
        nvmInstallNodeVersions $nvmVersion
    else
        echo "\n\n** Skipping install of Node."
    fi

    echo "\n\n** Let's finish our Node/nvm setup by setting default versions and what to use. **"
    nvmDefault

    echo "\n\n** ... To install more versions of Node with nvm later, use the nvm install <version> command.** "
}

nvmInstall () {
    echo "\n\n** Installing nvm via cURL (homebrew installation is not supported) ... **"

    if proceedOrSkip; then
        if [ -d "$HOME/.nvm" ]; then
            echo "\n\n ** nvm is already installed."
            # The nvm scripts do not copy nvm source scripts twice into bash profile.
        else 
            curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
        fi
    fi

    nvmInstallFollowup
}

# mostly just to ensure scripts are fallthru but also help the user
echoExit () {
    echo "\n\nDone."
}

init
symlinx
gitCompletion
brewInstall
nvmInstall
echoExit

# unset init, symlinx ...
