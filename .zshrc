. ~/.bash_profile

zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
# `compinit` scans $fpath, so do this before calling it.
fpath=(~/.zsh/ $fpath)
autoload -Uz compinit && compinit

# git branch on RHS of screen:
setopt prompt_subst
. ~/.git-prompt.sh
export RPROMPT=$'$(__git_ps1 "%s")'