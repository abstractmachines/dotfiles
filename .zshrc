ZSH_DISABLE_COMPFIX="true"

export GO111MODULE="on"
export GOPATH="$HOME/go"

. ~/.bash_profile

# depot tools:
# note: you must use the absolute path or Python will not be able to find infra tools;
# the PATH I have here hence won't work, but including it for documentation/memory
# export PATH="$HOME/dev/depot_tools:$PATH"

export CLOUDSDK_PYTHON="/usr/local/opt/python@3.8/libexec/bin/python"
# GCP:
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

source ~/.git-prompt.sh
setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# BE
# export PATH="/usr/local/opt/python@3.7/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export PATH="/usr/local/opt/postgresql@12/bin:$PATH"
