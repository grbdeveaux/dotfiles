.bashrc (mostly taken from https://www.linuxquestions.org/questions/linux-general-1/ultimate-prompt-and-bashrc-file-4175518169-print/)

Tmux and zsh theming and some functionality taken from https://github.com/Parth/dotfiles. deploy is also from the same source but modified for better echoing and conditional backups.

# deploy:

Deploy is a more advanced script which does the following:
1. Makes sure you have zsh, vim, and tmux installed
2. Helps install them if you don't
3. Checks to see if your default shell is zsh
4. Tries to change it if it's not
5. With permission, creates a backup of every config file/dir if none exists. If one exists, deploy terminates and the user is asked to handle the backup.
5. With permission, creates symlinks to every root config file or config directory (emacs and nvim)

Run deploy using `sh ~/dotfiles/deploy`

# Manually symlinking:

To create a new symlink (will fail if symlink exists already):
`ln -s /path/to/file /path/to/symlink`

To create or update a symlink:
`ln -sf /path/to/file /path/to/symlink`

## vim
`ln -s ~/dotfiles/vim ~/.vim`

`ln -s ~/dotfiles/vim/.vimrc ~/.vimrc`

## nvim
`ln -s ~/dotfiles/nvim ~/.config/nvim`

## .emacs.d
`ln -s ~/dotfiles/emacs/ ~/.emacs.d`

## .bashrc
`ln -s ~/dotfiles/bash/bashrc.sh ~/.bashrc`

## .zshrc
`ln -s ~/dotfiles/zsh/.oh-my-zsh ~/.oh-my-zsh`

`ln -s ~/dotfiles/zsh/zshrc_manager.sh ~/.zshrc`

## tmux
`ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf`

`ln -s ~/dotfiles/tmux/tmux.conf.local ~/.tmux.conf.local`
