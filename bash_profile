# ***** ^_^ bash profile, mostly for OSX but somewhat agnostic. ^_^ *****
#
# git, Kubernetes, Node, nvm, CLI snacks, scala java, and some lite db
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
