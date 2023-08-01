#!/bin/bash
export OS="OSX"

GIT_DIR="$( cd "$( dirname "$0"  )" && pwd  )"

if [ ! -d "$HOME/.config" ]
then
    mkdir "$HOME/.config"
fi

rm -rf $HOME/.config/nvim
rm -rf ~/.local/share/nvim/
rm -rf ~/.local/state/nvim/
ln -s -f $GIT_DIR/_vimrc ~/.vimrc
ln -s -f $GIT_DIR/nvim ~/.config/nvim
ln -s -f $GIT_DIR/_vimrc.base ~/.vimrc.base
ln -s -f $GIT_DIR/_vimrc.unimap ~/.vimrc.unimap

if ! command -v git &> /dev/null
then
    echo "installing git..."
    if [[ $OS = "linux" ]]; then
        sudo apt update
        sudo apt install git snapd curl wget -y
    elif [[ $OS = "OSX" ]]; then
        brew install git curl wget
    fi
fi
if ! command -v nvim &> /dev/null
then
  brew install neovim fzf
  $(brew --prefix)/opt/fzf/install
fi
