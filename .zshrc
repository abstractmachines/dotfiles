. ~/.bash_profile

# Specific prompt for zsh
# https://stackoverflow.com/questions/1128496/to-get-a-prompt-which-indicates-git-branch-in-zsh
PROMPT='abstractmachines-devbox '

my_prompt () {
  echo "abstrakt-devbox"
}

git_prompt () {
 ref=$(git symbolic-ref HEAD | cut -d'/' -f3)
 echo $ref
}

setopt prompt_subst # enable prompt substitution
PS1=$(my_prompt)\ $(git_prompt)\ $\  # add the function to your prompt
autoload -U promptinit
promptinit
