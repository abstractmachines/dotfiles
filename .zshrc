ZSH_DISABLE_COMPFIX="true"

export GO111MODULE="on"
export GOPATH="$HOME/go"

. ~/.bash_profile

source ~/.git-prompt.sh
setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
