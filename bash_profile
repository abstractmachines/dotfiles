# ***** ^_^ bash profile, mostly for OSX but somewhat agnostic. ^_^ *****
#
# git, Kubernetes, Node, nvm, ESLinting in EDI, CLI snacks, scala java, and some lite db
# -> Dependencies: homebrew pkg mgr; nvm-installed-and-managed versions of Node.
# -> This is an abstracted file that I also use as a memory recall for working.



# ***** ***** Node ***** *****

# Load NVM with each new Terminal window :
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # loads nvm bash_completion

# use particular version of Node e.g. 10.15.3 :
nvm use 10



# ***** ***** git ***** *****

# bash completion :
# Make sure to install first: $ brew install git bash-completion
# or put the same file in your HOME dir and PATH.
#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

source /usr/local/etc/bash_completion

# git branch (show on command line prompt) :
export PS1="\\w:\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$ "

# You can also use this instead:
# Git branch in prompt.
#parse_git_branch() {
#  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}
#
#export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Aliases :
alias ga="git add"
alias gb="git branch"
alias gc="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gl="git log"
alias gs="git status"


# ***** ***** Installing ESLint + Prettier in JS projects (VSCode IDE) ***** *****
# 1. Install ESLint && Prettier VSCode Extensions
# 2. CMD , -> Preferences -> set things up and stuff using search
# 3. Install this locally in your repo if you want as dev dependencies:
# > npm i -D eslint prettier eslint-plugin-prettier eslint-config-prettier eslint-plugin-node eslint-config-node
# 4. Use Airbnb rules. Execute the cmd/binary and also install its peer deps:
# > npx install-peerdeps --dev eslint-config-airbnb
# 5. create config files in VSCode as run command files.
# 5a. Prettier: at project root, create .prettierrc and add in rules as JSON objects.
# 5b. ESLint: You can either manually create .eslint.rc.json or similar (reliant on 
# several params such as your babel config and stuffs), or install ESLint globally
# and have the global install then generate your file:
# > sudo npm install -g eslint
# > eslint --init
# For ES6/React/Vue projects, choose JavaScript import/export
# For Node projects, choose CommonJS require/export
# Choose Airbnb style
# 6. After ESLint generates the file, make it so that .eslint.rc.json only has:
#{
#  "extends": ["airbnb", "prettier"],  // or "plugin:prettier/recommended"
#  "plugins": ["prettier"],
#  "rules": {} // or "rules": { "prettier/prettier": "error" }
#}
# ... Now your files should work just fine for standard linting.
# More on integration here: https://prettier.io/docs/en/integrating-with-linters.html
# Note that you may need to edit VSCode .editorconfig and integrate.
# See info here: https://prettier.io/docs/en/integrating-with-linters.html
# See also: https://github.com/prettier/prettier-vscode#linter-integration



# ***** ***** Kubernetes ***** *****

alias k8s="kubectl"
alias k-conf="kubectl config"
alias k-context="kubectl config current-context"
alias k-context-dev="kubectl config use-context clusterboi"

# ~/dev/resources/resources_scripts/scripts in $PATH
# kpods does something like:
alias kpods-namespaceboi="kubectl get pods -o wide -L chart -L tag -n namespaceboi"
alias kpods-deleteit="kubectl delete deploy -n namespaceboi --context clusterboi your-app"

# How much headroom does a namespace haz?
alias namespaceboi-headroom="kubectl --context clusterboi describe resourcequota -n namespaceboi"
# (tip: You can use Grafana deployment object, or similar metrics, to see what it's actually using.)
# Also see resource profiles for your system.

# Minikube
alias mk="minikube"
alias mkh="minikube -help"
alias mks="minikube start"
# If your MiniKube has to be v0.25.1, we use asdf pkg mgr :
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash



# ***** for scala projects, you need this stuff ***** *****

# JAVA
# install FAQ: https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_install_faq.html#CHDJEDDB

# JRE
alias jre-version="/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/java -version"
# https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jre.html#A1096856

# JDK
alias jdk-version="java -version"
# https://docs.oracle.com/javase/8/docs/technotes/guides/install/mac_jdk.html

# ** Other aliases for Java stuff **
# Java Compiler Manpage:
# > man javac
# Java Home Manpage:
# > man java_home
# Java Application Launcher Manpage:
# > man java



# ***** db ***** *****

# MySQL
alias mysql-login="mysql --host=localhost --port=0000 --user=fakeuser --password=fake-auth"
alias mysql-login2="mysql -u fakeuser -h mysql.domain.com -p fake-auth"
# > show databases;
# > show tables;
# > desc user; // schemas, structure.
# > describe tableName; // schemas, structure.
# > select user, host, authentication_string from mysql.user; // later versions of mysql...
# > $ mysql --host=localhost DBNAME --port=0000 --user=fakeuser --password=fake-auth

# postgres
# start:
alias pgstart="pg_ctl -D /usr/local/var/postgres start"
# stop:
alias pgstop="pg_ctl -D /usr/local/var/postgres stop"
# get into db:
alias pgdb="psql postgres"
