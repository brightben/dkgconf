#!/bin/sh
echo 'The following files will be deleted.'
ls -al \
    ~/.bashrc \
    ~/.gitconfig \
    ~/.hgrc \
    ~/.screenrc \
    ~/.tcshrc \
    ~/.tmux.conf \
    ~/.vim \
    ~/.vimrc \
    ~/.pyrc.py \
    ~/bin \
    ~/.ssh/config \
    
    
while [ 1 ]; do
    printf 'continue? (Y/n)'
    read ans
    case $ans in
        [Yy]*)
            break;;
        [Nn]*)
            exit 0;;
    esac
done

rm -rf ~/.bashrc
rm -rf ~/.gitconfig
rm -rf ~/.hgrc
rm -rf ~/.screenrc
rm -rf ~/.tcshrc
rm -rf ~/.tmux.conf
rm -rf ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.pyrc.py
rm -rf ~/bin
rm -rf ~/.ssh/config

ln -s dkgconf/local/bashrc      ~/.bashrc
ln -s dkgconf/local/gitconfig   ~/.gitconfig
ln -s dkgconf/local/hgrc        ~/.hgrc
ln -s dkgconf/local/screenrc    ~/.screenrc
ln -s dkgconf/local/tcshrc      ~/.tcshrc
ln -s dkgconf/local/tmux.conf   ~/.tmux.conf
ln -s dkgconf/local/vim         ~/.vim
ln -s dkgconf/local/vimrc       ~/.vimrc
ln -s dkgconf/local/pyrc.py     ~/.pyrc.py
ln -s dkgconf/local/bin         ~/bin
ln -s ../dkgconf/local/ssh_config ~/.ssh/config

echo '...done'

