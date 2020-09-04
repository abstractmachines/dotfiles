

des libicucore.dylib (but nothing else).

If you need to have icu4c first in your PATH run:
  echo 'export PATH="/usr/local/opt/icu4c/bin:$PATH"' >> ~/.zshrc
  echo 'export PATH="/usr/local/opt/icu4c/sbin:$PATH"' >> ~/.zshrc

For compilers to find icu4c you may need to set:
  export LDFLAGS="-L/usr/local/opt/icu4c/lib"
  export CPPFLAGS="-I/usr/local/opt/icu4c/include"

==> Summary
🍺  /usr/local/Cellar/icu4c/67.1: 258 files, 71.2MB
==> Installing node
==> Pouring node-14.9.0.catalina.bottle.tar.gz
==> Caveats
Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
==> Summary
🍺  /usr/local/Cellar/node/14.9.0: 4,670 files, 61.9MB
==> Caveats
==> icu4c
icu4c is keg-only, which means it was not symlinked into /usr/local,
because macOS provides libicucore.dylib (but nothing else).

If you need to have icu4c first in your PATH run:
  echo 'export PATH="/usr/local/opt/icu4c/bin:$PATH"' >> ~/.zshrc
  echo 'export PATH="/usr/local/opt/icu4c/sbin:$PATH"' >> ~/.zshrc

For compilers to find icu4c you may need to set:
  export LDFLAGS="-L/usr/local/opt/icu4c/lib"
  export CPPFLAGS="-I/usr/local/opt/icu4c/include"



==> node
Bash completion has been installed to:
  /usr/local/etc/bash_completion.d





ase note that upstream has asked us to make explicit managing
nvm via Homebrew is unsupported by them and you should check any
problems against the standard nvm install method prior to reporting.

You should create NVM's working directory if it doesn't exist:

  mkdir ~/.nvm

Add the following to ~/.zshrc or your desired shell
configuration file:

  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

You can set $NVM_DIR to any location, but leaving it unchanged from
/usr/local/opt/nvm will destroy any nvm-installed Node installations
upon upgrade/reinstall.

Type `nvm help` for further information.

Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
==> Summary
🍺  /usr/local/Cellar/nvm/0.35.3: 7 files, 150KB, built in 2 seconds


.12, run `brew reinstall docker`
Warning: gdb 9.2_1 is already installed and up-to-date
To reinstall 9.2_1, run `brew reinstall gdb`
Warning: go 1.15 is already installed and up-to-date
To reinstall 1.15, run `brew reinstall go`
Warning: htop 3.0.1 is already installed and up-to-date
To reinstall 3.0.1, run `brew reinstall htop`
Error: No available formula with the name "mongo" 
==> Searching for a previously deleted formula (in the last month)...
Error: No previously deleted formula found.
==> Searching for similarly named formulae...
These similarly named formulae were found:
mongo-c-driver                        mongo-cxx-driver                      mongo-orchestration                   mongoose
To install one of them, run (for example):
  brew install mongo-c-driver




