#! /bin/zsh
# Create Symlinks to keep all files in the dotfiles folder
[[ ! -a ~/.gitconfig ]] && ln -s `pwd`/.gitconfig ~/.gitconfig

[[ ! -a ~/.vim ]] && ln -s `pwd`/.vim ~/.vim
[[ ! -a ~/.vimrc ]] && ln -s `pwd`/.vimrc ~/.vimrc

[[ ! -a ~/.zshrc ]] && ln -s `pwd`/.zshrc ~/.zshrc
[[ ! -a ~/.zshenv ]] && ln -s `pwd`/.zshenv ~/.zshenv
[[ ! -a ~/.zsh ]] && ln -s `pwd`/.zsh ~/.zsh

[[ ! -a ~/bin ]] && ln -s `pwd`/bin ~/bin
