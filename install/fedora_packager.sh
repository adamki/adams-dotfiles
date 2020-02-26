#!/bin/bash
. ./utils/colors.sh

DNF_PACKAGES=(
  gotop
  neovim-nightly
  feh
  bat
  compton
  curl
  firefox
  htop
  i3-gaps
  nitrogen
  otf-fira-code
  ranger
  ripgrep
  rofi
  timeshift
  timeshift-autosnap
  tmux
  xclip
  xcape
)

GLOBAL_NPM_PACKAGES=(
  bash-language-server
  eslint
  neovim
  vim-language-server
)

RUBY_GEMS=(
  bundler
  neovim
  lolcat
)

echo -e "${HR}"
echo -e "${bold}Installing Latest Ruby...${normal}"
rbenv install $(rbenv install -l | grep -v - | tail -1)

echo -e "${HR}"
echo -e "${bold}Setting Ruby Default...${normal}"
rbenv global $(rbenv install -l | grep -v - | tail -1)

echo -e "${HR}"
echo -e "${bold}Installing Ruby Gems...${normal}"
gem install ${RUBY_GEMS[@]}

echo -e "${HR}"
echo -e "${bold}RBENV doctor...${normal}"
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

echo -e "${HR}"
echo -e "${bold}Installing NPM Packages...${normal}"
npm i -g ${GLOBAL_NPM_PACKAGES[@]}

echo -e "${HR}"
echo -e "${bold}Installing NeoVIM Python Provider...${normal}"
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim

echo -e "${HR}"
echo -e "${bold}Installing PACMAN Packages...${normal}"
sudo pacman -S ${DNF_PACKAGES[@]}

echo -e "${HR}"
echo -e "${bold}${green}Packager Complete...${normal}"
