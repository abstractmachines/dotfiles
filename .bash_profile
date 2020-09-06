source ~/cli-utils/.alias
# source ~/cli-utils/.git-conf

# doesn't work:
# Git branch in prompt.
# parse_git_branch() {
#   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }
# parse_git_branch


# ***** Colors
# changes the bash prompt to be colorized, and rearranges the prompt such as “username@hostname:cwd $”
# export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\] $ "
# To see your current prompt: echo $PS1
# By default the command prompt is set to [\u@\h \W]\$. username, host, workingdir, UID.
# Before you modify settings save your old prompt using the following command:
# oldps1="$PS1"
# So if you messed up, you can switch back easily using the following syntax:
# PS1="$oldps1"
# Use the export command to setup a new shell prompt:
# $ export PS1="[\\u@\\H \\W \\@]\\$ "
# To add colors:
# \e[ : Start color scheme. x;y : Color pair to use (x;y)  $PS1 : Your shell prompt variable. \e[m : Stop color scheme.
# cyan: 36, blue: 34, green: 32, purple: 35, red: 31, etc. 0;31 versus 31 versus 031.


# ***** nvm 
# if this already exists, nvm will skip appending it on installation (see bootstrap.sh):
# => nvm source string already in /Users/yourUser/.bash_profile
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
