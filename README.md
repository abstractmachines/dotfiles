# abstractmachines' dotfiles (Mac)

![Screenfetch](./img/screenfetch-dotfiles.png)

## Lightning/Quick Install
After creating `.env` file in root dir of this repo, run `sh init.bootstrap.exclude.sh`
and it'll symlink appropriate dotfiles to your home directory.

> Sample .env file:
```
GITHUB_USERNAME="your-username"
GITHUB_EMAIL="your-username@domain.com"
```

## Installation (Detailed / For Beginners)
1. Back up your existing dotfiles. If your dotfiles are stored in `bash_profile`
in your home directory, make a backup copy of that file, because the scripts in
this repo will symlink to your [home directory](https://en.wikipedia.org/wiki/Home_directory) when you run the bootstrap.sh script.

2. `git clone` this repo ([instructions here on how to clone a repo](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository)) and `cd` into `dotfiles` dir.

3. Create an `.env` file for your Github username and email. [Here's why](https://12factor.net/config).

4. Run the bootstrap script. `sh ./init.bootstrap.sh`.

5. Tell your shell to recognize the changes to your environment, by [sourcing 
your bash profile](https://stackoverflow.com/questions/4608187/how-to-reload-bash-profile-from-the-command-line) with `source ~/.bash_profile`.

# TODO list
- [ ] tmux / conf.
- [ ] aliases: use env files

Colors (next up)
- [ ] Base16 shell https://github.com/chriskempson/base16-shell

