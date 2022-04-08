# dotfiles

These are my dotfiles. Currently these dotfiles are for a Mac, zsh setup,
but the files can easily be configured for bash instead of zsh.

## Most relevant things

- [Bootstrap bash installation script (Darwin-specific)](./init.bootstrap.sh)
- [Command line aliases](./cli-utils/.alias)
- [Tmux usage, readline etc](TMUX.md)

## Install

After creating `.env` file in root dir of this repo, run `sh init.bootstrap.exclude.sh`
and it'll symlink appropriate dotfiles to your home directory.

> Sample .env file:

```
GITHUB_USERNAME="your-username"
GITHUB_EMAIL="your-username@domain.com"
```

## Themes

Here's a preview of a few themes:

> tmux

- (WIP)

> Terminal, custom theme:

![Screenfetch](./img/screenfetch-dotfiles.png)

## This work was based on (thanks to):

- [@mathiasbynens](https://github.com/mathiasbynens/dotfiles) - The go-to place for dotfiles inspiration
- [@hamvocke's dotfiles](https://github.com/hamvocke/dotfiles)
- [@ajmalsiddiqui's dotfiles](https://github.com/ajmalsiddiqui/dotfiles/)
- [Readline Cheat Sheet](https://readline.kablamo.org/emacs.html)

## Installation (Detailed)

1. Back up your existing dotfiles. If your dotfiles are stored in `bash_profile`
   in your home directory, make a backup copy of that file, because the scripts in
   this repo will symlink to your [home directory](https://en.wikipedia.org/wiki/Home_directory) when you run the bootstrap.sh script.

2. `git clone` this repo ([instructions here on how to clone a repo](https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository)) and `cd` into `dotfiles` dir.

3. Create an `.env` file for your Github username and email. [Here's why](https://12factor.net/config).

4. Run the bootstrap script. `sh ./init.bootstrap.sh`.

5. Tell your shell to recognize the changes to your environment, by [sourcing
   your bash profile](https://stackoverflow.com/questions/4608187/how-to-reload-bash-profile-from-the-command-line) with `source ~/.bash_profile`.
