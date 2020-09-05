# abstractmachines' dotfiles (Mac)

![Screenfetch](./img/screenfetch-dotfiles.png)

## Lightning/Quick Install
Run `bootstrap.exclude.sh` and it'll symlink to your home directory. Clone or
fork the repo, modify as needed, and use as your own! ^_^

## Installation (Detailed / For Beginners)
1. Back up your existing dotfiles. If your dotfiles are stored in `bash_profile`
in your home directory, make a backup copy of that file, because the scripts in
this repo will symlink to your [home directory](https://en.wikipedia.org/wiki/Home_directory) when you run the bootstrap.sh script.

2. `git clone` this repo ([instructions here on how to clone a repo](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository)) and `cd` into `dotfiles` dir.

3. Run the bootstrap script. `sh ./bootstrap.sh`.

4. Tell your shell to recognize the changes to your environment, by [sourcing 
your bash profile](https://stackoverflow.com/questions/4608187/how-to-reload-bash-profile-from-the-command-line) with `source ~/.bash_profile`.

## About these scripts

Notice that the bootstrap script has a few functions; the bootstrap script 
installs basic software to run your Mac. 

# TODO list


## TODO List aliases
- [ ] git autocomplete CLI

- [ ] Uninstall Node from homebrew installation. We're using it via nvm. Look this up!

- [ ] symlinx() : TODO loop through gitconfig and gitignore in this diretory (copy those files over to symlinked home dir)

- [ ] PATH: VSCode binary

- [ ] Set a color scheme like Ham Vocke.
- [ ] Screenfetch on new mac
- [ ] Image of script running (dotfiles kitteh)
