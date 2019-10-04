#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# this scrpt comes from http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

################################################################################
# three steps to syncing dotfiles on a new machine.
# 1. cd ~/dotfiles
# 2. chmod +x makesymlinks.sh
# 3. ./makesymlinks.sh
################################################################################

########## Variables
dir=~/dotfiles
backupdir=~/dotfiles_old
neovimpath=~/.config/nvim
ftpluginpath=~/.config/nvim/ftplugin
alacrittypath=~/.config/alacritty
kittypath=~/.config/kitty
i3path=~/.config/i3
rofipath=~/.config/rofi
polybarpath=~/.config/polybar

# list of files/folders to symlink in homedir
files="tmux.conf
vimrc
zshrc
config/nvim/coc-settings.json
config/nvim/init.vim
config/nvim/ftplugin/plugins.vim
config/nvim/ftplugin/nerdtree.vim
config/nvim/ftplugin/system.vim
config/nvim/ftplugin/keymappings.vim
config/nvim/ftplugin/aesthetic.vim
config/nvim/ftplugin/filetypes.vim
config/nvim/ftplugin/fold.vim
config/kitty/kitty.conf
config/i3/config
config/rofi/config
config/kitty/one-dark-256.conf"

# Set up NVIM path
mkdir -p $neovimpath
printf "Created dir: $neovimpath ...............................................done. \n"

# Set up kitty path
mkdir -p $kittypath
printf "Created dir: $kittypath ..........................................done. \n"

# Set up ftplugin path
mkdir -p $ftpluginpath
printf "Created dir: $ftpluginpath ......................................done. \n"

# create dotfiles_old in homedir
mkdir -p $backupdir
printf  "Created dir: $backupdir ...............................................done. \n"

# create i3 path
mkdir -p $i3path
printf  "Created dir: $i3path ...............................................done. \n"

# create rofi path
mkdir -p $rofipath
printf  "Created dir: $rofipath ...............................................done. \n"

# change to the dotfiles directory
cd $dir
printf "CD to dir: $dir ...............................................done. \n"

printf "\n\n"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    mv ~/.$file $backupdir
    ln -s $dir/$file ~/.$file
    printf "Symlinking ~/$file ----------------- >>>  $dir/$file \n"
done

printf "\n\n"
printf "Complete"

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
  # Set the default shell to zsh if it isn't currently set to zsh
  if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
    chsh -s $(which zsh)
  fi
else
  # If zsh isn't installed, get the platform of the current machine
  platform=$(uname);
  # If the platform is Linux, try an apt-get to install zsh and then recurse
  if [[ $platform == 'Linux' ]]; then
    if [[ -f /etc/redhat-release ]]; then
      sudo yum install zsh
      install_zsh
    fi
    if [[ -f /etc/debian_version ]]; then
      sudo apt-get install zsh
      install_zsh
    fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
      printf "Please install zsh, then re-run this script! \n"
      exit
    fi
  fi
}

# install_zsh