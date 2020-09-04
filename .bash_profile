# source ./cli-utils/.nvm
# source ./cli-utils/.git

export PATH="/usr/local/sbin:/Users/carebearstare/.nvm/versions/node/v10.15.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


source ./cli-utils/.alias


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
# 6. After ESLint generates the file, make it so that .eslint.rc.json only has
#   the following (so you can use Prettier and ESLint together!):
#   ... the following example has just a couple rules.
# {
#  "extends": ["airbnb", "prettier"],
#  "plugins": ["prettier"],
#  "rules": {
#    "prettier/prettier": "error",
#    "no-unused-vars": "warn",
#    "no-console": "error"
#  }
#}
# ... Now your files should work just fine for standard linting.
# More on integration here: https://prettier.io/docs/en/integrating-with-linters.html
# Note that you may need to edit VSCode .editorconfig and integrate.
# See info here: https://prettier.io/docs/en/integrating-with-linters.html
# See also: https://github.com/prettier/prettier-vscode#linter-integration
